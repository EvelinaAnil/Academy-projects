package annotation;

public @interface SecondAnnotation {
    enum Color{
        RED, GREEN, BLUE, WHITE
    }

    Color color() default Color.WHITE;
}
