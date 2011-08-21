== Highfive Tuesdays
Highfive Tuesdays is a weekly highfive competition designed to make the workplace a more fun place to be. It's ultimately based on the honor system, but uses a confirmation scheme to at least limit cheating.

== Running It
It's just a standard Rails application, so deploy normally. It also uses Faye for push notifications. You can start faye using:

    rackup faye.ru -s thin -E production

That's all there is to it! Enjoy. 
