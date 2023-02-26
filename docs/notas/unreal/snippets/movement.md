Notes:
- Must inherit from `AActor`
- `VisualMesh` has to be declared in the header file as it is an attribute.

## Get actor location/position and rotation
```cpp
// Those only work because the class inherits from AActor
FVector NewLocation = GetActorLocation();
FRotator NewRotation = GetActorRotation();
```

## Setting position/location
```cpp
NewLocation.Z += something;
```

## Rotating an Axis
```cpp
NewRotation.Yaw += something; // Yaw is rotation in y axix (vertical)
```

## Set actor location/position and rotation
```cpp
// Sets the new location
SetActorLocationAndRotation(NewLocation, NewRotation);
```