Input can only be applied to pawns, and classes which inherit from pawns.

The movement is handled by a `PawnMovementComponent` , which is described [here](pawn_movement). My class has to override the `TickComponent` method from the upper class.

Here is a snippet:
```cpp
void UCollidingPawnMovementComponent::TickComponent(float DeltaTime, enum ELevelTick TickType, FActorComponentTickFunction *ThisTickFunction)
{

	Super::TickComponent(DeltaTime, TickType, ThisTickFunction);

	if (!PawnOwner || !UpdatedComponent || ShouldSkipUpdate(DeltaTime))
	{
		return;
	}

	FVector DesiredMovementThisFrame = ConsumeInputVector().GetClampedToMaxSize(1.0f) * DeltaTime * 150.0f;

	if (!DesiredMovementThisFrame.IsNearlyZero())
	{
		FHitResult Hit;
		SafeMoveUpdatedComponent(DesiredMovementThisFrame, UpdatedComponent->GetComponentRotation(), true, Hit);

		if (Hit.IsValidBlockingHit())
		{
			SlideAlongSurface(DesiredMovementThisFrame, 1.f - Hit.Time, Hit.Normal, Hit);
		}
	}
}
```

So here it how this works:
-  It calculates the desired movement according to the input.
- Then it uses `SafeMoveUpdatedComponent` to update the component position.
- Then, it snaps it back into the collision boundary using `SlideAlongSurface`.

The important thing here is that the component will update whatever actor is it connected to. So we don´t really know which actor is being updated in here -- instead, we just declare what movement we want to have.

The reason why we do it, is that this will generate a callback to the input handler that is part of the pawn actor. We handle this inside the handler callbacks in the actor itself. For that reason, we need to setup those callbacks:
```cpp
void ACollidingPawn::SetupPlayerInputComponent(UInputComponent *PlayerInputComponent)
{
	Super::SetupPlayerInputComponent(PlayerInputComponent);

	InputComponent->BindAction("ParticleToggle", IE_Pressed, this, &ACollidingPawn::ParticleToggle);
	InputComponent->BindAxis("MoveForward", this, &ACollidingPawn::MoveForward);
	InputComponent->BindAxis("MoveRight", this, &ACollidingPawn::MoveRight);
	InputComponent->BindAxis("Turn", this, &ACollidingPawn::Turn);
}
```
This is done inside the class that extends `APawn`.

And also, inside this class we need to declare and add the code to handle the events. This is what the header looks like:
```cpp
// ...

public:
	void MoveForward(float AxisValue);
	void MoveRight(float AxisValue);
	void Turn(float AxisValue);
	void ParticleToggle();

// ...
```

And this is what the implementation looks like:
```cpp
void ACollidingPawn::MoveForward(float AxisValue) {
	if(OurMovementComponent && (OurMovementComponent->UpdatedComponent == RootComponent))
	{
		OurMovementComponent->AddInputVector(GetActorForwardVector() * AxisValue);
	}
}

void ACollidingPawn::MoveRight(float AxisValue)
{
	if(OurMovementComponent && (OurMovementComponent->UpdatedComponent == RootComponent))
	{
		OurMovementComponent->AddInputVector(GetActorRightVector() * AxisValue);
	}
}

void ACollidingPawn::Turn(float AxisValue)
{
	FRotator NewRotation = GetActorRotation();
	NewRotation.Yaw += AxisValue;
	SetActorRotation(NewRotation);
}

void ACollidingPawn::ParticleToggle()
{
	if(OurParticleSystem && OurParticleSystem->Template)
	{
		OurParticleSystem->ToggleActive();
	}
}
```

Also, we need to make sure that we possess the pawn. This is done inside the constructor:
```
AutoPossessPlayer = EAutoReceiveInput::Player0;
```

Finally, we add the PawnMovement component to the Pawn actor:
```
TheMovementComponent = CreateDefaultSubobject<UCollidingPawnMovementComponent>(TEXT("CustomMovementComponent"));
TheMovementComponent->UpdatedComponent = RootComponent;
```

Last, but not least, we need to map the input inside the editor. This is done at `Edit->Project Settings->Input`, and looks like this:
![[UE5 Input Settings Screenshot.png]]

> There is a new way of defining the input, as you can see in the screenshot above. There is very sparse documentation about this right now, so I am moving on with the default approach as of now.