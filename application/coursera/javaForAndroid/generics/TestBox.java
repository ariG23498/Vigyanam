public class TestBox{
    public static void main(String args[]){
        Box<String> str = new Box<String>();
        str.set("Hello World");
        System.out.println(str.get());

        Box<Integer> integer = new Box<Integer>();
        integer.set(1234);
        System.out.println(integer.get());
    }
}