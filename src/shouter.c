/*  =========================================================================
    shouter - class description

    Copyright (c) the Authors
    =========================================================================
*/

/*
@header
    shouter -
@discuss
@end
*/

#include "zprotut_classes.h"

//  Structure of our class

struct _shouter_t {
    int filler;     //  Declare class properties here
};


//  --------------------------------------------------------------------------
//  Create a new shouter

shouter_t *
shouter_new (const char* name)
{
    shouter_t *self = (shouter_t *) zmalloc (sizeof (shouter_t));
    assert (self);
    //  Initialize class properties here
    printf("Created shouter:%s\n",name);
    return self;
}


//  --------------------------------------------------------------------------
//  Destroy the shouter

void
shouter_destroy (shouter_t **self_p)
{
    assert (self_p);
    if (*self_p) {
        shouter_t *self = *self_p;
        //  Free class properties here
        //  Free object itself
        free (self);
        *self_p = NULL;
    }
}

//  *** Draft method, for development use, may change without warning ***
//  Shout once!
int shouter_shout (shouter_t *self, const char *shout_text)
{
    printf("SHOUT:%s\n",shout_text);
    return 1;
}

//  *** Draft method, for development use, may change without warning ***
//  Shout multiple times!
int shouter_shout_multi (shouter_t *self, const char *shout_text, int times)
{
    for (int i=0;i<times;i++){
        shouter_shout(self,shout_text);    
    }
    return times;
}

//  --------------------------------------------------------------------------
//  Self test of this class

// If your selftest reads SCMed fixture data, please keep it in
// src/selftest-ro; if your test creates filesystem objects, please
// do so under src/selftest-rw.
// The following pattern is suggested for C selftest code:
//    char *filename = NULL;
//    filename = zsys_sprintf ("%s/%s", SELFTEST_DIR_RO, "mytemplate.file");
//    assert (filename);
//    ... use the "filename" for I/O ...
//    zstr_free (&filename);
// This way the same "filename" variable can be reused for many subtests.
#define SELFTEST_DIR_RO "src/selftest-ro"
#define SELFTEST_DIR_RW "src/selftest-rw"

void
shouter_test (bool verbose)
{
    printf (" * shouter: ");

    //  @selftest
    //  Simple create/destroy test
    shouter_t *self = shouter_new ("shouter1");
    assert (self);

    int times = shouter_shout(self,"forty");
    assert(times==1);

    times = shouter_shout_multi(self,"multi_shoot",4);
    assert(times==4);

    shouter_destroy (&self);
    //  @end
    printf ("OK\n");
}
