require 'kramdown'
require 'fileutils'


def generate_web_page(infile)
    puts "Generate webpage for " + infile
    output = $caneva.sub("<!--FAKE_BODY-->", Kramdown::Document.new(File.read(infile)).to_html)
    output.gsub!("<!--FAKE_TITLE-->",$title);
    output.gsub!("{ROOT}",$root);
    return output
end

def generate_blog_entry(infile)
    puts "Generate blogpage for " + infile
    head = 0
    rawtext=""
    IO.foreach(infile) do |line|
        if line =~ /^-+$/
            head += 1
            next
        end

        if head < 2 then
            k = line.split(":", 2)
            puts "key " + k[0]
            puts "value " + k[1]
        else
            rawtext += line
        end
    end
    output = $caneva.sub("<!--FAKE_BODY-->", Kramdown::Document.new(rawtext).to_html)
    output.gsub!("{ROOT}",$root);
    return output
end

def copy_static(infile, outdir)
    return if not need_update(infile, outdir)

    puts "Copy " + infile + " " + outdir
    FileUtils.copy(infile, outdir)
    return true
end

def need_update(src, dst)
    return true if $force or ( not File.exists?(dst) )
    if File.mtime(dst) <= File.mtime(src)
        return true
    else
        return false
    end
end

def iterate(dir)
    Dir.foreach(dir) do |filename|
        next if /^\./ =~ filename # skip hidden files and dirs

        src    = dir + "/" + filename
        outdir = ".output/" + dir
        outfile  = filename.sub(/md$/,"html"),

        # Itterate inside directories
        if File.directory?(src)
            iterate(src)
        else

            if not File.exists?(outdir)
                # create the path if missing
                FileUtils.mkdir_p(outdir)
            end

            if /.*\.md$/ !~ filename
                copy_static(src, outdir + "/" +  filename)
                next
            end

            dst = outdir + "/" + filename.sub(/md$/,"html")
            next if not need_update(src, dst)

            if /\/blog\// =~ dir then
                outstring = generate_blog_entry(src)
            else
                outstring = generate_web_page(src)
            end

            f = File.open(dst,'w')
            f.puts(outstring)
            f.close
        end
    end
end

$root=""
$title="~rodrigo"
$force =  false
$caneva = File.read("index.html")
FileUtils.mkdir_p(".output") if not File.exists?(".output")
iterate("www")
#Kramdown::Document.new(text).to_html
