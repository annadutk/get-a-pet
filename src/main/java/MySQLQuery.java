import java.sql.*;
import Row;

public class MySQLQuery {

  public static void main(String[] args) {
  
    try {
      String myDriver = "org.gjt.mm.mysql.Driver";
      String myUrl = "jdbc:mysql://localhost/test";
      Class.forName(myDriver);
      Connection conn = DriverManager.getConnection(myUrl, "root", "");
      
      String query = request.getParameter("queryForm");
      Statement st = conn.createStatement();
      ResultSet rs = st.executeQuery(query);
      List<Row> table = new ArrayList<Row>();

      Row.formTable(rs, table);

      int i = 0;
      for (Row row : table) {
        if (i = 5) { break; }
        for (Entry<Object, Class> col: row.row) {
          out.print(" > " + ((col.getValue()).cast(col.getKey())));
        }
      out.println();
      }

      st.close();
    }
    catch (Exception e)
    {
      System.err.println("Got an exception! ");
      System.err.println(e.getMessage());
    }
  }
}