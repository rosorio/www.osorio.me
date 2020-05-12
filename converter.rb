require 'kramdown'
require 'fileutils'


def iterate(dir) 
    Dir.foreach(dir) do |filename|
        next if /^\./ =~ filename

        if File.directory?(dir + "/" + filename) then
            iterate(dir + "/" + filename )
        end
        next if /.*\.md$/ !~ filename

        if not File.exists?(".output/" + dir) then
            FileUtils.mkdir_p(".output/" + dir)
        end

        puts(".output/" + dir + "/" + filename.sub(/md$/,"html"))

    	output = $caneva.sub("<!--FAKE_BODY-->", Kramdown::Document.new(File.read(dir + "/" + filename)).to_html)
        output.gsub!("{ROOT}",$root);
        f = File.open(".output/" + dir + "/" + filename.sub(/md$/,"html"),'w')
        f.puts(output)
        f.close
    end
end

#$root="/home/rodrigo/projects/siteweb/.output/"
$root=""
$caneva = File.read("index.html")
FileUtils.mkdir_p(".output") if not File.exists?(".output")
iterate(".")
#Kramdown::Document.new(text).to_html
