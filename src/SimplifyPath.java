import java.util.ArrayList;

class SimplifyPath {
    public String simplifyPath(String path) {
        ArrayList<String> pathComponents = new ArrayList<>();
        for (String s : path.split("/")) {
            if (s.length() > 0 && !s.equals(".")) {
                if (s.equals("..")) {
                    if (!pathComponents.isEmpty()) {
                        pathComponents.remove(pathComponents.size() - 1);
                    }
                } else {
                    pathComponents.add(s);
                }
            }
        }
        StringBuilder sb = new StringBuilder();
        sb.append("/");
        for (String s : pathComponents) {
            sb.append(s);
            sb.append("/");
        }
        return sb.length() == 1 ? sb.toString() : sb.toString().substring(0, sb.length() - 1);
    }

    public static void main(String[] args) {
        SimplifyPath simplyPath = new SimplifyPath();
        System.out.println(simplyPath.simplifyPath("/../"));
    }
}