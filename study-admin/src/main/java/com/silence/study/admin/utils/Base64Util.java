package com.silence.study.admin.utils;

import org.apache.commons.io.FileUtils;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import java.io.*;

/**
 * <br>
 * <b>功能：</b>公司相册表管理<br>
 * <b>作者：</b>@author Silence<br>
 * <b>日期：</b>2018-05-28 00:46:01<br>
 * <b>详细说明：</b><br>
 */
public class Base64Util {
    /**
     * 图片转化成base64字符串
     * 将图片文件转化为字节数组字符串，并对其进行Base64编码处理
     *
     * @return
     */
    public static String GetImageStr(String imgInputPath) {
        InputStream in;
        byte[] data = null;
        //读取图片字节数组
        try {
            in = new FileInputStream(imgInputPath);
            data = new byte[in.available()];
            in.read(data);
            in.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        //对字节数组Base64编码
        BASE64Encoder encoder = new BASE64Encoder();
        //返回Base64编码过的字节数组字符串
        return encoder.encode(data);
    }


    /**
     * base64字符串转化成图片
     * 对字节数组字符串进行Base64解码并生成图片
     *
     * @param imgStr
     * @return
     */
    public static boolean GenerateImage(String imgStr, String outFilePath) {
        //图像数据为空
        if (imgStr == null) {
            return false;
        }
        BASE64Decoder decoder = new BASE64Decoder();
        try {
            //Base64解码
            byte[] b = decoder.decodeBuffer(imgStr);
            for (int i = 0; i < b.length; ++i) {
                //调整异常数据
                if (b[i] < 0) {
                    b[i] += 256;
                }
            }
            File file = new File(outFilePath);
            if (!file.getParentFile().exists()) {
                FileUtils.forceMkdir(file.getParentFile());
            }
            OutputStream out = new FileOutputStream(outFilePath);
            out.write(b);
            out.flush();
            out.close();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public static void main(String[] args) {
        String strImg = GetImageStr("/Users/silence/Downloads/广告素材/1920x1080.jpg");
        System.out.println(strImg);
        GenerateImage(strImg, "/Users/silence/Downloads/广告素材/aaa.jpg");
    }

}