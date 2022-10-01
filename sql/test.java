public class test {
    private Boolean isInt(String id) {
        int test;
        try {
            test = Integer.parseInt(id);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
