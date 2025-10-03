// RandomWalker.java
import java.io.*;
import java.util.Random;
import org.json.*;   // from json.jar

public class Bot {
  public static void main(String[] args) throws Exception {
    BufferedReader br = new BufferedReader(new InputStreamReader(System.in, "UTF-8"));
    boolean firstTick = true;
    Random rng = new Random(1L);

    String line;
    while ((line = br.readLine()) != null) {
      JSONObject data = new JSONObject(line);

      if (firstTick) {
        JSONObject cfg = data.optJSONObject("config");
        int width  = cfg != null ? cfg.optInt("width", 0)  : 0;
        int height = cfg != null ? cfg.optInt("height", 0) : 0;
        System.err.println("Random walker (Java) launching on a " + width + "x" + height + " map");
      }

      String[] moves = {"N","S","E","W"};
      System.out.println(moves[rng.nextInt(moves.length)]);
      System.out.flush();
      firstTick = false;
    }
  }
}
