package com.silence.study.admin.utils;

import com.origin.eurybia.utils.DateUtils;
import com.origin.eurybia.utils.PropertiesUtil;
import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

public class UploadifyUtils {

    /**
     * 根目录
     **/
    public final static String UPLOAD_ROOT;
    /**
     * URL前缀
     **/
    public final static String UPLOAD_URL;
    /**
     * 上传文件路径
     **/
    public final static String UPLOAD_PATH;

    /**
     * 自定义目录
     **/
    private static String CUSTOM_PATH;


    static {
        UPLOAD_ROOT = PropertiesUtil.get("upload.root");
        UPLOAD_URL = PropertiesUtil.get("upload.url");
        UPLOAD_PATH = PropertiesUtil.get("upload.path");
    }

    /**
     * 原文件名
     */
    private String fileName;

    /**
     * 新文件名
     */
    private String newName;

    /**
     * 后缀名
     */
    private String extName;

    /**
     * 文件件类型路径
     */
    private String fileTypePath = "";

    /**
     * 文件大小
     */
    private String fileSize;

    /**
     * 返回信息
     */
    private Map<String, Object> resultMap = new HashMap<String, Object>();

    /**
     * 文件io流
     */
    private InputStream inputStream;

    public UploadifyUtils() {
    }

    public UploadifyUtils(HttpServletRequest request) throws Exception, IOException {
        CUSTOM_PATH = "";
        paserReqeust(request);
    }


    /**
     * <b>paserReqeust</b><br/>
     * <p>解析request</p>
     * <b>date：</b>2014-6-17 下午4:40:43<br/>
     *
     * @param request
     * @throws java.io.IOException
     * @throws Exception
     * @throws
     * @since 1.0
     */
    private void paserReqeust(HttpServletRequest request) throws Exception, IOException {
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();

        for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {
            MultipartFile mf = entity.getValue();
            fileName = mf.getOriginalFilename();
            extName = fileName.indexOf(".") != -1 ? fileName.substring(fileName.lastIndexOf("."), fileName.length()) : null;

            String rootPath = getRandomLongStr();

            if (extName.equals(".gif") || extName.equals(".png") || extName.equals(".jpg")) {
                fileTypePath = "/img";
            } else if (extName.equals(".apk")) {
                fileTypePath = "/apk";
            }
            String root = UPLOAD_ROOT + fileTypePath;
            newName = uploadPath(rootPath + extName, root);
            inputStream = mf.getInputStream();

            //转换文件大小为M
            fileSize = inputStream.available() + "";

            File uploadFile = new File(UPLOAD_PATH + newName);
            this.write(mf, uploadFile);
        }
    }


    /**
     * 保存文件
     *
     * @param saveFile
     * @throws java.io.IOException
     */
    public void write(MultipartFile mf, File saveFile) throws IOException {
        if (!saveFile.getParentFile().exists()) {
            FileUtils.forceMkdir(saveFile.getParentFile());
        }
        mf.transferTo(saveFile);
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getExtName() {
        return extName;
    }

    public void setExtName(String extName) {
        this.extName = extName;
    }

    public InputStream getInputStream() {
        return inputStream;
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }

    public String getNewName() {
        return newName;
    }

    public void setNewName(String newName) {
        this.newName = newName;
    }

    public Map<String, Object> getResultMap() {
        return resultMap;
    }

    public void setResultMap(Map<String, Object> resultMap) {
        this.resultMap = resultMap;
    }

    public String getFileSize() {
        return fileSize;
    }

    public String getFileTypePath() {
        return fileTypePath;
    }

    public void setFileTypePath(String fileTypePath) {
        this.fileTypePath = fileTypePath;
    }

    public static String uploadPath(String fileName,String dir){
        StringBuffer path = new StringBuffer();
        path.append(dir).append("/");//图片根目录
        path.append(DateUtils.formatDate(new Date(), "yyyyMMdd")).append("/");
        path.append(fileName);
        return path.toString();
    }

    /**
     * 获取随机长字符串，文件名、订单号...
     *
     * @return
     */
    public static String getRandomLongStr() {

        String str = DateUtils.formatDate(new Date(), "yyyyMMddHHmmss") + getRandNo(6);
        return str;
    }

    /**
     * 生成多少位的随机数
     *
     * @param dit
     * @return
     */
    public static String getRandNo(int dit) {
        StringBuffer sb = new StringBuffer("");
        Random random = new Random();
        for (int i = 0; i < dit; i++) {
            sb.append(random.nextInt(10));
        }
        return sb.toString();
    }
}
