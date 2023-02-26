The pawn is the main controllable entity class. It can be a character or something else, but if something has to control it, it needs to in inherit from `Pawn` at some time. The pawn is an actor, which replaces the `Entity`in the ECS. We add components to the pawn, in order to add behavior to it.

The car in the game has to be a `Pawn`.

The pawn has to be constructed as a masterclass, where we add all components to it. They are not injected though -- they are usually created inside the constructor.

> I don´t like this, I have to study if there is a way to separate the wiring from the setup of the object.

There is nothing special about the pawn itself -- we have to add a bunch of components to it at the constructor in order to add behavior to it.
