package annotation;

public @interface Third {
    String[] value();

    FirstAnnotation first() default @FirstAnnotation(key = 123);


}
