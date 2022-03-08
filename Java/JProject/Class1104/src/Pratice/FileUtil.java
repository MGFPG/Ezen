package Pratice;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStream;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

public class FileUtil {
	 /**

     * @param file 개인정보가 저장된 파일

     * @return List<PersonInfo>

     */

    public static List<PersonInfo> readFile(File file) throws IOException {
        FileReader filereader = null;
        List<PersonInfo> InfoList = new ArrayList<PersonInfo>();
 
        try {
            filereader = new FileReader(file);

            //파일에서 읽어온 정보를 List에 저장한다.

            InfoList = readReader(filereader);

        } finally {
            if (filereader != null)
                filereader.close();
        }
        return InfoList;
    }


    /**

     * 

     * @param dir 저장할 디렉토리

     * @param name 파일명

     * @param InfoList 개인정보가 저장된 List

     * @throws IOException

     * 

     */

    public static void writeFile(String dir, String name, List<PersonInfo> InfoList ) throws IOException {
        OutputStream out = null;
        
        try {
            File dirent = new File(dir);
            
            //저장할 디렉토리가 존재하지 않으면 생성

            if(!dirent.exists()) {
                dirent.mkdir();
            }

            File outFile = new File(dir, name);

            //파일이 존재한다면 삭제한다.

            if(outFile.exists()) {
                outFile.delete();
            }

            //파일에 String값을 입력할 BufferedOutputStream 생성

            out = new BufferedOutputStream(new FileOutputStream(outFile));

            for(int idx=0; idx < InfoList.size(); idx++) {

                //List에서 개인정보를 가져온다.

                String writeStr = InfoList.get(idx).getPN() + "," + InfoList.get(idx).getName() + "," + InfoList.get(idx).getAge() + ","

                                + InfoList.get(idx).getSex() + ","+ InfoList.get(idx).getNumber() + "," + InfoList.get(idx).getPhonenumber()+"\n";

 

                //저장한 string값을 Byte 배열로 변경

                byte[] b = writeStr.getBytes();

                

                //파일에 해당 내용을 쓴다.

                out.write(b);

            }

        } catch (IOException ioe) {

            //입출력에서 예외발생시 예외 내용 출력

            ioe.printStackTrace();

            throw ioe;

        } finally {

            try {

                //BufferdOutputStream 객체를 close해준다.

                if (out != null) out.close();

            } catch (Exception e) {

            }

        }

    } 

    

    /**

     * 

     * @param input

     * @return

     * @throws IOException

     */

    public static List<PersonInfo> readReader(Reader input) throws IOException {

        try {

            //파일의 내용을 읽어들일 BufferReader 객체 생성

            BufferedReader in = new BufferedReader(input);

            String line;

            

            List<PersonInfo> InfoList = new ArrayList<PersonInfo>();

 

            //파일을 한줄씩 읽어간다. 

            while((line=in.readLine()) != null) {

                // ","로 split하여 배열에 저장

                String[] writeStr = line.split(",");

                

                // 모든 정보가 저장되어 있지 않다면 skip한다.

                if(writeStr.length != 6) continue;

                

                PersonInfo personInfo = new PersonInfo();

                

                //각 개인정보를 저장한다.

                personInfo.setPN(Integer.parseInt(writeStr[0]));

                personInfo.setName(writeStr[1]);

                personInfo.setAge(Integer.parseInt(writeStr[2]));

                personInfo.setSex(writeStr[3]);

                personInfo.setNumber(writeStr[4]);

                personInfo.setPhonenumber(writeStr[5]);

                

                //리스트에 객체 추가.

                InfoList.add(personInfo);

            }

            

            return InfoList;

        } finally {

            input.close();

        }

    }

}
