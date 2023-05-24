package com.kbstar.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.FileOutputStream;

public class FileUploadUtil {
    //	파일덩어리와 디렉토리를 주면 내가 저장해주다
    public static void saveFile(MultipartFile mf, String dir) {
        byte[] data;
        String imgname = mf.getOriginalFilename();
        try {
            data = mf.getBytes();
            FileOutputStream fo =
                    new FileOutputStream(dir + imgname);
            fo.write(data);
            fo.close();
        } catch (Exception e) {
            e.printStackTrace();

        }

    }

}




