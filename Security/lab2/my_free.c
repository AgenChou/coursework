/*
 * Ex. 2: Overwriting free.
 *
 * NOTE: this program has to be compiled with -D_GNU_SOURCE -fPIC -shared -ldl 
 * flags, and works definitely on lab machines, but may not work in others
 * (e.g. my laptop >.< )
 */

#include <stdio.h>
#include <stdint.h>
#include <dlfcn.h>

// We need to store the pointers that were freed. To avoid limiting the size
// (e.g. with an array), we use a linked list, similar to Ex. 1.
struct address {
        struct address * next;
        void * data;
};

struct addr_list {
        struct address * head;
};

void append_address(struct addr_list * list, void * val) {
        struct address * addr = malloc(sizeof(struct address));
        addr->data = val;
        addr->next = NULL;
        if (list->head == NULL) {
                list->head = addr;
        } else {
                struct address * tail = list->head;
                while (tail->next != NULL) {
                        tail = tail->next;
                }
                tail->next = addr;
        }
};

// thisneeds to be global
struct addr_list our_list = {NULL};

void free (void* ptr) {
        static void* (*wrapped_free) (void *) = NULL;
        // we want to be able to use the real free, so need a pointer to it
        if (wrapped_free == NULL) {
                wrapped_free = dlsym(RTLD_NEXT, "free");
        }
        
        
        // before we pass a call to the real malloc, we check if it wasn't
        // freed before, otherwise add and free it
        if (our_list.head == NULL) {
                append_address(&our_list, &ptr);
                wrapped_free(ptr);
        } else {
                struct address * temp = our_list.head;
                while (temp != NULL) {
                        // extra logging
                        printf("freeng %p\n", (void*)(&ptr));
                        if (temp->data == &ptr) {
                                return;
                        } else {
                                append_address(&our_list, &ptr);
                                wrapped_free(ptr);
                        }
                }
        }
}

