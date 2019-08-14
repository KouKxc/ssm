package cn.kxc.ssm.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {
    //日期转换字符串
    public static String dateToString(Date date,String s){
        SimpleDateFormat sdf = new SimpleDateFormat(s);
        String format = sdf.format(date);
        return format;
    }
    //字符串转换为日期
    public static Date stringToDate(String string,String s) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat(s);
        Date parse = sdf.parse(string);
        return parse;
    }
}
