package com.kbstar.controller;

import com.kbstar.dto.Ncp;
import com.kbstar.util.CFRCelebrityUtil;
import com.kbstar.util.CFRFaceUtil;
import com.kbstar.util.FileUploadUtil;
import com.kbstar.util.OCRUtil;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@Controller
public class NcpController {

    @Value("${uploadimgdir}")
    String imgpath;

    @Autowired
    CFRCelebrityUtil celebrityUtil;
    CFRFaceUtil cfrFaceUtil;

    @RequestMapping("/cfr1impl")
    public String cfr1impl(Model model, Ncp ncp) throws ParseException {
        // 이미지 저장 한다.
        FileUploadUtil.saveFile(ncp.getImg(), imgpath);
        // NCP에 요청 한다.
        String imgname = ncp.getImg().getOriginalFilename();
        JSONObject result = (JSONObject) celebrityUtil.getResult(imgpath, imgname);
        log.info(result.toJSONString());

        JSONArray faces = (JSONArray) result.get("faces");
        JSONObject obj = (JSONObject) faces.get(0);
        JSONObject celebrity = (JSONObject) obj.get("celebrity");
        String value = (String) celebrity.get("value");

        // 결과를 받는다.
        model.addAttribute("result", value);
        model.addAttribute("center", "cfr1");
        return "index";
    }

    @RequestMapping("/cfr2impl")
    public String cfr2impl(Model model, Ncp ncp) throws ParseException {
        // 이미지 저장 한다.
        FileUploadUtil.saveFile(ncp.getImg(), imgpath);
        // NCP에 요청 한다.
        String imgname = ncp.getImg().getOriginalFilename();
        JSONObject result = (JSONObject) cfrFaceUtil.getResult(imgpath, imgname);
        log.info(result.toJSONString());

        String emotion_value = "";
        String gender_value = "";
        String pose_value = "";
        String age_value = "";

        JSONArray faces = (JSONArray) result.get("faces");
        JSONObject obj = (JSONObject) faces.get(0);

        JSONObject gender = (JSONObject) obj.get("gender");
        gender_value = (String) gender.get("value");

        JSONObject emotion = (JSONObject) obj.get("emotion");
        emotion_value = (String) emotion.get("value");

        JSONObject pose = (JSONObject) obj.get("pose");
        pose_value = (String) pose.get("value");

        JSONObject age = (JSONObject) obj.get("age");
        age_value = (String) age.get("value");


        Map<String, String> map = new HashMap<>();
        map.put("emotion", emotion_value);
        map.put("pose", pose_value);
        map.put("gender", gender_value);
        map.put("age", age_value);

//        JSONObject age = (JSONObject) obj.get("age");
//        age_value = (String) age.get("value");
//
//        JSONObject values = new JSONObject();
//        values.put("emotion_value", emotion_value);
//        values.put("gender_value", gender_value);
//        values.put("pose_value", pose_value);
//        values.put("age_value", age_value);

        // 결과를 받는다.
//        model.addAttribute("result", gender_value);
//        model.addAttribute("result", emotion_value);
//        model.addAttribute("result", pose_value);
//        model.addAttribute("result", age_value);

        model.addAttribute("result", map);
        model.addAttribute("center", "cfr2");

        return "index";
    }

    @RequestMapping("/mycfr")
    public String mycfr(Model model, String imgname) throws ParseException {

        // NCP에 요청 한다.
        JSONObject result = (JSONObject) cfrFaceUtil.getResult(imgpath, imgname);
        log.info(result.toJSONString());

        String emotion_value = "";
        String gender_value = "";
        String pose_value = "";
        String age_value = "";

        JSONArray faces = (JSONArray) result.get("faces");
        JSONObject obj = (JSONObject) faces.get(0);

        JSONObject gender = (JSONObject) obj.get("gender");
        gender_value = (String) gender.get("value");

        JSONObject emotion = (JSONObject) obj.get("emotion");
        emotion_value = (String) emotion.get("value");

        JSONObject pose = (JSONObject) obj.get("pose");
        pose_value = (String) pose.get("value");

        JSONObject age = (JSONObject) obj.get("age");
        age_value = (String) age.get("value");


        Map<String, String> map = new HashMap<>();
        map.put("emotion", emotion_value);
        map.put("pose", pose_value);
        map.put("gender", gender_value);
        map.put("age", age_value);

        model.addAttribute("result", map);
        model.addAttribute("center", "pic");

        return "index";
    }

    @RequestMapping("/ocr1impl")
    public String ocr1impl(Model model, Ncp ncp) throws ParseException {
        // 이미지 저장 한다.
        FileUploadUtil.saveFile(ncp.getImg(), imgpath);
        // NCP에 요청 한다.
        String imgname = ncp.getImg().getOriginalFilename();
        JSONObject result = (JSONObject) OCRUtil.getResult(imgpath, imgname);

        Map map = OCRUtil.getData(result);

        // 결과를 받는다.
        model.addAttribute("result", map);
        model.addAttribute("center", "ocr1");

        return "index";
    }

    @RequestMapping("/ocr2impl")
    public String ocr2impl(Model model, Ncp ncp) throws ParseException {
        // 이미지 저장 한다.
        FileUploadUtil.saveFile(ncp.getImg(), imgpath);
        // NCP에 요청 한다.
        String imgname = ncp.getImg().getOriginalFilename();
        JSONObject result = (JSONObject) OCRUtil.getResult(imgpath, imgname);

        Map map = OCRUtil.getBob(result);

        // 결과를 받는다.
        model.addAttribute("result", map);
        model.addAttribute("center", "ocr2");

        return "index";
    }

}