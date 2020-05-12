# List and Queue, the BSD way

The BSD comes with a macro facility to manage lists and queues

* **Single linked** structures ie. **singly-linked list** and **singly-linked tailq**
* **Double linked** structures ie. **list** and **tailq**

## Capabilities array

|                                           | SLIST | STAILQ | LIST | TAILQ |
|-------------------------------------------|-------|--------|------|-------|
| Insert an element at the head of the list | YES   | YES    | YES  | YES   |
| Insert an element at the end of the list  | NO    | YES    | NO   | YES   |
| Insert an element before another element  | NO    | YES    | NO   | YES   |
| Insert an element after another element   | YES   | YES    | YES  | YES   |
| Remove an element at the head of the list | YES   | YES    | YES  | YES   |
| Remove an element at the end of the list  | NO    | YES    | NO   | YES   |
| Remove an element before another element  | YES   | YES    | YES  | YES   |
| Remove an element after another element   | NO    | YES    | NO   | YES   |
| Can be traversed forward                  | YES   | YES    | YES  | YES   |
| Can be traversed backwards                | NO    | YES    | NO   | YES   |
| Can be concatenated with another same structure | NO | YES | NO   | YES   |
| Pointers per head                         | 1 | 2 | 1 | 2 |
| Pointers per node                         | 1 | 1 | 2 | 2 |

## What the structures looks like

### SLIST
    Head
    +------+
    | Begin|
    +------+
     |  +---+   +---+   +---+
     `->|N0 |-->|N1 |-->|N2 |
        +---+   +---+   +---+

### STAILQ

    Head
    +------+
    | End  |--------------,
    +------+              |
    | begin|              |
    +------+              V
     |  +---+   +---+   +---+
     `->|N0 |-->|N1 |-->|N2 |
        +---+   +---+   +---+

### LIST

    Head
    +------+
    | Begin|
    +------+
     |  +---+   +---+   +---+
     `->|N0 |-->|N1 |-->|N2 |
        +---+   +---+   +---+
            ^---'   ^---'

###TAILQ

    Head
    +------+
    | End  |--------------,
    +------+              |
    | begin|              |
    +------+              V
     |  +---+   +---+   +---+
     `->|N0 |-->|N1 |-->|N2 |
        +---+   +---+   +---+
            ^---'   ^---'

## Using SLIST

### Source code

    #include <sys/queue.h>
    #include <stdio.h>
    #include <stdlib.h>
    
    typedef struct node_t {
        int value;
        SLIST_ENTRY (node_t) next;
    } node_t;
    
    int main()
    {
        int i;
        node_t * pnode;
    
        /* SLIST head :
         * struct head_t {
         *   struct node_t *sle_next;
         * }
         */
        SLIST_HEAD (head_t, node_t);
    
        struct head_t head;
    
        /* Initialize head
         * head->sle_next = NULL;
         */
        SLIST_INIT (&head);
    
        /* Create 6 node and insert them in head */
        for (i=1;i<6;i++){
            /* Alloc the fists node */
            pnode = malloc (sizeof(struct node_t));
            pnode->value = i;
            /* Insert the newnode in head */
            SLIST_INSERT_HEAD(&head,pnode,next);
            printf("Insert Node %d\n",pnode->value);
        }
    
        SLIST_FOREACH(pnode,&head, next){
            printf("Dump Node %d\n",pnode->value);
        }
    
        while ((pnode = SLIST_FIRST(&head)) != NULL) {
          printf("Delete Node %d\n",pnode->value);
          SLIST_REMOVE(&head,pnode,node_t,next);
          free(pnode);
        }
      }

### Compile & run

    cc exemple_slist.c -o exemple_slist
    ./exemple_slist

The output is :

    Insert Node 1
    Insert Node 2
    Insert Node 3
    Insert Node 4
    Insert Node 5
    Dump Node 5
    Dump Node 4
    Dump Node 3
    Dump Node 2
    Dump Node 1
    Delete Node 5
    Delete Node 4
    Delete Node 3
    Delete Node 2
    Delete Node 1
    
