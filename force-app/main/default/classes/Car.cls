public class Car {
    public ProjectDefs.CarType type;
    public Integer wheelSize;

    public override String toString()
    {
        return String.format('Type: {0}, WheelSize: {1}', new List<Object>{type, wheelSize});
    }
}