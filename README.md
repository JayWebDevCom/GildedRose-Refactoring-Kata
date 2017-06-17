## GildedRose-Refactoring-Kata

#### Refactoring
* My first task was to write tests and test edge cases of food items as they passed through the Gilded Rose `update` method. This confirmed to me that the codebase did what it promised.
* My strategy was then to refactor - knowing that I had these tests to confirm to me that my new code was not changing the outcome of the `update` method - just refactoring appropriately.
* I first extracted methods, one per food item type which were applied to food item objects through a switch statement.
* I realised I had 4 methods with differing prefixes and repeated suffixes which was a clear indication of the need to create classes.

#### Configuration
* Clone this repo
* $ bundle install
* rspec
* Feature tests on a per item basis can be seen in `/spec`

#### Introducing new classes for new behaviour
* Each food item to be updated now has an instance of a corresponding class created, which makes a method available to `update` that food item as necessary.
* 'item' is taken as a parameter to that `update` method.
* I noticed significant similar behaviour and structure across food item classes that I had created which led me to implement classical inheritance to the food item classes.
* I considered writing a module but I felt that as `update` behaviour was slightly different across food items, inheritance and therefore re-definition of the `update` method as necessary would be more suitable.

#### Open-Closed & Introducing New Behaviour
* I wanted to introduce the -O- from SOLID programming design principles whereby new behaviour can be introduced with out modification to existing code.
* I have worked on the Gilded Rose `update` method to the extent that new behaviour for conjured items can be added by adding specific conjured keyword to a hash of classes, and making a small corresponding class with that keyword for it's name. This class must then have an appropriate `update` method which must be named `update`.

#### Further Refactoring
* Currently, the code for the Sulfuras food item `update` has actually been removed. Sulfuras have a coding requirement whereby its attributes are left untouched. This inert `update` method can be drawn from my parent food item class which has an empty `update` method.

#### Resources
* I drew inspiration from the [Rails Conference Video by Sandi Metz](https://www.youtube.com/watch?v=8bZh5LMaSmE&feature=youtu.be) although there were significant differences between her codebase and mine.
* In this codebase, One gilded rose object iterates through an array of item objects which represent food item objects. In Sandi Metz’s video, I believe a Gilded Rose object was a food item object.
