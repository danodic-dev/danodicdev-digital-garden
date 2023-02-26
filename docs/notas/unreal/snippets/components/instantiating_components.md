A component is created inside the constructor of an actor, and it is created as follows:
```cpp
USphereComponent *SphereComponent = CreateDefaultSubobject<USphereComponent>(TEXT("RootComponent"));
```

The snippet above will:
- Create a new component of type `USphereComponent`;
- Set the name of this component as _"Root Component"_ ;
- Assign this component to a variable named `SphereComponent`.

