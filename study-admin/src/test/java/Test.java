import com.origin.eurybia.exception.OriginException;
import com.origin.eurybia.log.Logger;
import com.origin.eurybia.utils.DateUtils;

import javax.sound.midi.Soundbank;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.*;

/**
 * <br>
 * <b>功能：</b><br>
 * <b>作者：</b>silence<br>
 * <b>日期：</b>2017-02-12 16:08<br>
 * <b>详细说明：</b>无<br>
 */
public class Test {

    private static final Logger logger = Logger.getLogger(Test.class);
    private static final Set<String> set = new HashSet<>();
    private static final Map<String, Integer> macMap = new HashMap<>();
    private static final Map<String, Integer> ipMap = new HashMap<>();

    public static void main(String[] args) {

        //File file = new File("/Users/silence/Downloads/开机频繁_4004058_创维_20170408_log_final");
        try {
            readFileByLines("/Users/silence/Downloads/开机频繁_4004058_创维_20170408_log_final");
        } catch (OriginException e) {
            e.printStackTrace();
        }

    }

    public static void readFileByLines(String fileName) throws OriginException {
        File file = new File(fileName);
        BufferedReader reader = null;
        try {
            reader = new BufferedReader(new FileReader(file));
            String tempString = null;
            // 一次读入一行，直到读入null为文件结束
            int length = 0;
            long start = System.currentTimeMillis();
            while ((tempString = reader.readLine()) != null) {
                //if (length <= 10) {
                    String[] params = tempString.split("\\^");
                    String key = "";
                    for (String param : params) {
                        if (param.contains("m6a=")) {
                            String mac = param.substring(4, param.length());
                            key = mac;
                        }
                        if (param.contains("ip=") && !param.contains("raw")){
                            String ip = param.substring(3, param.length());
                            key = key + "--" + ip;
                        }
                    }
                    //System.out.println(key);
                    if (!macMap.containsKey(key)) {
                        macMap.put(key, 1);
                    }else {
                        macMap.put(key, macMap.get(key) + 1);
                    }
                //}
                length++;
            }
            reader.close();
            System.out.println("总行数为" + length);
            System.out.println("耗时" + (System.currentTimeMillis() - start));
            Integer lteFive = 0;
            Integer fiveToten = 0;
            Integer gtTen = 0;
            for (Map.Entry<String, Integer> map : macMap.entrySet()) {
                //System.out.println(map.getKey() + ": " + map.getValue());
                logger.info(map.getKey() + ": " + map.getValue());
                if (map.getValue() <= 5) {
                    lteFive += 1;
                }else if (map.getValue() > 5 && map.getValue() <= 10) {
                    fiveToten += 1;
                }else if (map.getValue() > 10){
                    gtTen += 1;
                }
            }
            System.out.println("mac总数为：" + macMap.size());
            System.out.println("5以下: " + lteFive + " 5--10: " + fiveToten + " 10以上:" + gtTen);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e1) {
                }
            }
        }
    }
}
