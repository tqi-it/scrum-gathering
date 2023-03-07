#ifndef FLUTTER_mentormeLICATION_H_
#define FLUTTER_mentormeLICATION_H_

#include <gtk/gtk.h>

G_DECLARE_FINAL_TYPE(MyApplication, mentormelication, MY, APPLICATION,
                     GtkApplication)

/**
 * mentormelication_new:
 *
 * Creates a new Flutter-based application.
 *
 * Returns: a new #MyApplication.
 */
MyApplication* mentormelication_new();

#endif  // FLUTTER_mentormeLICATION_H_
