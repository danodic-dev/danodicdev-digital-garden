Pawn movement is added by creating a component of type `PawnMovementComponent`that can be added to a pawn. This is the equivalent to the `ITransformable` I had in the Java engine.

This component also handles collision, and can possess any pawn in the scene. Most of this code comes from [here](https://docs.unrealengine.com/5.0/en-US/quick-start-guide-to-components-and-collision-in-unreal-engine-cpp/). Also, that works together with the [pawn](pawn) component.

Here is the header of the class:

```cpp
#pragma once

#include "CoreMinimal.h"
#include "GameFramework/PawnMovementComponent.h"
#include "CollidingPawnMovementComponent.generated.h"


UCLASS()
class CPPSANDBOX_API UCollidingPawnMovementComponent : public UPawnMovementComponent
{
GENERATED_BODY()

public:
	virtual void TickComponent(float DeltaTime, enum ELevelTick TickType, FActorComponentTickFunction *ThisTickFunction) override;

};
```

In the code above, `TickComponent`is an override of the method inherited from `UPawnMovementComponent`.

This is the implementation of the class methods:
```cpp
#include "CollidingPawnMovementComponent.h"

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

The code above will:
- Check if this component is the owner of the pawn it is connected to;
- It does some other checks, that I don´t understand yet what they are;
- It calculates the movement for this frame. We can clamp the value straight from the vector and multiply it by the delta time;
- By the way, all movement is provided by this `ConsumeInputVector` call. Not sure if this is only for movement (seems so);
- In case the calculated movement is not _virtually zero_, we don´t move. Else, we move.
- This function `SafeMoveUpdatedComponent`will move the component and collide against solids. It mutates the `Hit` instance we pass as an argument in order to add the collision information.
- In case we have a hit, slide the actor along the surface.