package libs;

public class Util {
    static String HOST = "http://localhost:8181/";
    static String HOST_ADMIN = "http://localhost:8181/Admin/";
    public static String fullPath(String path){return HOST+path;}
    public static String fullPathAdmin(String path){return HOST_ADMIN+path;}

}
