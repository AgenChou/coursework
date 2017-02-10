/*
 * Ex. 1b: ordered linked list implementation
 */

#include <stdio.h>
#include <stdlib.h>

// Struct for nodes
struct element {
	struct element* next;
	int data;
};

// struct for the list
struct linked_list {
	struct element* head;
};

// Returns the length of the list (max. is 6)
int length(struct linked_list * list) {
	int counter = 0;
	if (list->head != NULL) {
		struct element * elem = list->head;
		counter++;
		while (elem->next != NULL) {
			counter++;
			elem = elem->next;
		}
	}
	return counter;
}

// Remove the head of the list
void remove_head(struct linked_list * list) {
	struct element* elem = list->head;
	list->head = elem->next;
	// to avoid memory leaks, free the memory from the old head
	free(elem);
}

// add an element to the list
void append_int(struct linked_list * list, int val) {
	struct element * elem = malloc(sizeof(struct element));
	elem->data = val;
	elem->next = NULL;
	if (list->head == NULL) {
		list->head = elem;
	} else {
		// if list has 6 elements, we need to drop head, before adding
		// a new element
		if(length(list) == 6) {
			remove_head(list);
		}
		// work out where to put the new element
		struct element * tail = list->head;
		struct element * temp = NULL; // temp is the element just before temp
		while (tail != NULL && tail->data < val) {
			temp = tail;
			tail = tail->next; // move through the list
		}
		if (temp != NULL) {
			temp->next = elem;
		} else {
			list->head = elem; // if temp is null, we're inserting at the start of list
		}
		if (tail != NULL) {
			elem->next = tail; // tail is null when we're at the end of the list
		}
	}
};


void main(int argc, char *argv[]) {
	struct linked_list list = {NULL};
	for(int k = 0; k < 11; k++) {
		append_int(&list, rand() % 100); // the only reason for % is readibility 
		struct element* elem = list.head;
		while (elem != NULL) {
			printf("%d -> ", elem->data);
			elem = elem->next;
		}
		printf("\n");
	}
}
