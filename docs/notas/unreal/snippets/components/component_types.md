Here are some of the component types I have used so far:

## `USphereComponent`
A spherical shape component -- can be a root component.
```cpp
USphereComponent *SphereComponent = CreateDefaultSubobject<USphereComponent>(TEXT("RootComponent"));

RootComponent = SphereComponent;

SphereComponent->InitSphereRadius(40.0f);
SphereComponent->SetCollisionProfileName(TEXT("Pawn"));

// Create a mesh component and attach it to the sphere component.
UStaticMeshComponent *SphereVisual = CreateDefaultSubobject<UStaticMeshComponent>(TEXT("VisualRepresentation"));
SphereVisual->SetupAttachment(RootComponent);
```

>? I am not sure why this is a _sphere_ component. I believe this is related to the collision shape, but I am not sure yet.

## `UStaticMeshComponent`
Assigns a mesh to be rendered as part of the actor. This is the `IRendererable`.
```cpp
// Create a mesh component and attach it to some component
UStaticMeshComponent *SphereVisual = CreateDefaultSubobject<UStaticMeshComponent>(TEXT("VisualRepresentation"));
SphereVisual->SetupAttachment(RootComponent);

// Load a shape
static ConstructorHelpers::FObjectFinder<UStaticMesh> SphereVisualAsset(TEXT("/Game/StarterContent/Shapes/Shape_Sphere.Shape_Sphere"));

// This Succeeded is a pattern -- we use this to check if the asset loaded sucessfully, every time we load something.
if (SphereVisualAsset.Succeeded())
{
	// Assign the mesh to the component and do some transformation.
	SphereVisual->SetStaticMesh(SphereVisualAsset.Object);
	SphereVisual->SetRelativeLocation(FVector(0.0f, 0.0f, -40.0f));
	SphereVisual->SetWorldScale3D(FVector(0.8f));
}
```

> There may be something equivalent to the `AssetManager` from LibGDX to load assets in bulk.

## `USpringArmComponent`
Assigns a camera that will follow the actor, with an interpolated movement. This is the `ILookable` combined with `IFollowable` (+ the `CameraEntity`).
```cpp
USpringArmComponent *SpringArm = CreateDefaultSubobject<USpringArmComponent>(TEXT("CameraAttachmentArm"));

SpringArm->SetupAttachment(RootComponent);
SpringArm->SetRelativeRotation(FRotator(-45.f, 0.f, 0.f));
SpringArm->TargetArmLength = 400.0f;
SpringArm->bEnableCameraLag = true;
SpringArm->CameraLagSpeed = 3.0f;

UCameraComponent *Camera = CreateDefaultSubobject<UCameraComponent>(TEXT("ActualCamera"));
Camera->SetupAttachment(SpringArm, USpringArmComponent::SocketName);
```

The camera component is not attached to the root component -- instead, we attach the spring arm to the camera.

## `UParticleSystemComponent` 
A particle system that is emitted relative to the actor position.
```cpp
OurParticleSystem = CreateDefaultSubobject<UParticleSystemComponent>(TEXT("MovementParticles"));
OurParticleSystem->SetupAttachment(SphereVisual);
OurParticleSystem->bAutoActivate = false;
OurParticleSystem->SetRelativeLocation(FVector(-20.0f, 0.0f, 20.0f));

static ConstructorHelpers::FObjectFinder<UParticleSystem> ParticleAsset(TEXT("/Game/StarterContent/Particles/P_Fire.P_Fire"));
if (ParticleAsset.Succeeded())
{
	OurParticleSystem->SetTemplate(ParticleAsset.Object);
}
```
