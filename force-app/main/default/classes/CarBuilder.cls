public class CarBuilder {
    public class CarBuilderException extends Exception{}

    private class Impl implements ISpecifyCarType, ISpecifyWheelSize, IBuildCar
    {
        private Car car = new Car();

        public ISpecifyWheelSize ofType(ProjectDefs.CarType type)
        {
            car.type = type;
            return this;
        }

        public IBuildCar withWheels(Integer size)
        {
            Boolean crossoverWheelsAreTooBigOrSmall = car.type == ProjectDefs.CarType.Crossover && size < 17 || size > 20;
            Boolean sedanWheelsAreTooBigOrSmall = car.type == ProjectDefs.CarType.Sedan && size < 15 || size > 17;
            if(crossoverWheelsAreTooBigOrSmall || sedanWheelsAreTooBigOrSmall)
            {
                throw new CarBuilderException('Rodas não são do tamanho suportado');
            }

            car.wheelSize = size;
            return this;
        }

        public Car build()
        {
            return car;
        }
    }

    public static ISpecifyCarType create()
    {
        return new Impl();
    }
}