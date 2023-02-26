```cpp
// The editor takes care of displaying this one in the right way
UPROPERTY(VisibleAnywhere)
UStaticMeshComponent* VisualMesh;

// This one addds the field inside a category
UPROPERTY(EditAnywhere, BlueprintReadWrite, Category="FloatingActor")
float FloatSpeed = 20.0f;
```