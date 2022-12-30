package warehouse_project;

import java.sql.*;
import java.util.*;
import java.time.LocalDate;

class MyClass extends Thread {

    // thread that recieves a hashmap and prints its contents
    public void run(HashMap<ArrayList<String>, HashMap<String, String>> map, Connection connDW) {
        // // insert into dw
        String query1 = "INSERT INTO customers VALUES (?,?)";
        String query2 = "INSERT INTO products VALUES (?,?,?)";
        String query3 = "INSERT INTO suppliers VALUES (?,?)";
        String query4 = "INSERT INTO stores VALUES (?,?)";
        String query5 = "INSERT INTO times VALUES (?,?,?,?,?,?,?)";
        String query6 = "INSERT INTO transactions VALUES (?,?,?,?,?,?,?,?)";

        for (Map.Entry<ArrayList<String>, HashMap<String, String>> entry : map.entrySet()) {
            // System.out.println(entry.getKey() + " " + entry.getValue());

            // insert into customers
            try {
                PreparedStatement ps1 = connDW.prepareStatement(query1);
                ps1.setString(1, entry.getValue().get("cust_id"));
                ps1.setString(2, entry.getValue().get("cust_name"));
                ps1.executeUpdate();
            } catch (Exception e) {
            }
            // insert into products
            try {
                PreparedStatement ps2 = connDW.prepareStatement(query2);
                ps2.setString(1, entry.getValue().get("prod_id"));
                ps2.setString(2, entry.getValue().get("prod_name"));
                ps2.setString(3, entry.getValue().get("prod_price"));
                ps2.executeUpdate();
            } catch (Exception e) {
            }
            // insert into suppliers
            try {
                PreparedStatement ps3 = connDW.prepareStatement(query3);
                ps3.setString(1, entry.getValue().get("supplier_id"));
                ps3.setString(2, entry.getValue().get("supplier_name"));
                ps3.executeUpdate();
            } catch (Exception e) {
            }

            // insert into stores
            try {
                PreparedStatement ps4 = connDW.prepareStatement(query4);
                ps4.setString(1, entry.getValue().get("store_id"));
                ps4.setString(2, entry.getValue().get("store_name"));
                ps4.executeUpdate();
            } catch (Exception e) {
            }
            // insert into time
            try {
                PreparedStatement ps5 = connDW.prepareStatement(query5);
                ps5.setString(1, entry.getValue().get("time_id"));
                ps5.setString(2, entry.getValue().get("date"));
                ps5.setString(3, entry.getValue().get("day"));
                ps5.setString(4, entry.getValue().get("week_num"));
                ps5.setString(5, entry.getValue().get("month"));
                ps5.setString(6, entry.getValue().get("quarter"));
                ps5.setString(7, entry.getValue().get("year"));

                ps5.executeUpdate();
            } catch (Exception e) {
            }

            // insert into transactions
            try {
                PreparedStatement ps6 = connDW.prepareStatement(query6);
                ps6.setString(1, entry.getValue().get("trans_id"));
                ps6.setString(2, entry.getValue().get("prod_id"));
                ps6.setString(3, entry.getValue().get("cust_id"));
                ps6.setString(4, entry.getValue().get("supplier_id"));
                ps6.setString(5, entry.getValue().get("store_id"));
                ps6.setString(6, entry.getValue().get("time_id"));
                ps6.setString(7, entry.getValue().get("quantity"));
                ps6.setString(8, entry.getValue().get("sales"));
                ps6.executeUpdate();
            } catch (Exception e) {
            }
        }

    }

}

public class meshJoin {

    public static void main(String[] args) {
        Connection connDB = null;
        Connection connDW = null;
        Connection connMD = null;

        Statement stmtDB = null;
        Statement stmtDW = null;
        Statement stmtMD = null;

        String url_db = "jdbc:mysql://127.0.0.1:3306/db";
        String url_dw = "jdbc:mysql://127.0.0.1:3306/dw";
        String url_md = "jdbc:mysql://127.0.0.1:3306/master_db";

        String user = "root";
        String password = "";
        ResultSet rs = null;

        // ask whether user wants to use default values or not
        System.out.println("Do you want to use default values? (y/n): ");
        Scanner sc = new Scanner(System.in);
        String ans = sc.nextLine();
        if (ans.equals("y")) {
            System.out.println("Using default values");
        } else {
            System.out.print("Enter the url of the database: ");
            url_db = sc.nextLine();
            System.out.print("Enter the url of the data warehouse: ");
            url_dw = sc.nextLine();
            System.out.print("Enter the url of the master database: ");
            url_md = sc.nextLine();
            System.out.print("Enter the username: ");
            user = sc.nextLine();
            System.out.print("Enter the password: ");
            password = sc.nextLine();
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connDB = DriverManager.getConnection(url_db, user, password);
            connDW = DriverManager.getConnection(url_dw, user, password);
            connMD = DriverManager.getConnection(url_md, user, password);
            if (connDB != null && connDW != null && connMD != null) {
                System.out.println("Connection is Successful.");

                stmtDB = connDB.createStatement();
                stmtDW = connDW.createStatement();
                stmtMD = connMD.createStatement();

                // count the number of rows in the table
                String sql = "SELECT COUNT(*) FROM transactions";
                ResultSet count = stmtDB.executeQuery(sql);
                count.next();
                int num_trans = count.getInt(1);

                // count the number of rows in the table
                sql = "SELECT COUNT(*) FROM products";
                count = stmtMD.executeQuery(sql);
                count.next();
                int num_prods = count.getInt(1);

                // count the number of rows in the table
                sql = "SELECT COUNT(*) FROM customers";
                count = stmtMD.executeQuery(sql);
                count.next();
                int num_cus = count.getInt(1);

                HashMap<ArrayList<String>, HashMap<String, String>> map = new HashMap<ArrayList<String>, HashMap<String, String>>();

                // create a queue of hashmaps
                Queue<HashMap<ArrayList<String>, HashMap<String, String>>> queue = new LinkedList<HashMap<ArrayList<String>, HashMap<String, String>>>();
                for (int i = 0; i < num_trans; i += 5000) {
                    // select 50 transactions
                    sql = "SELECT * FROM transactions LIMIT " + i + ",5000";
                    rs = stmtDB.executeQuery(sql);

                    map = new HashMap<ArrayList<String>, HashMap<String, String>>();
                    while (rs.next()) {
                        String key = rs.getString("customer_id") + " " + rs.getString("product_id");
                        // value is the rs
                        String trans_id = rs.getString("transaction_id");
                        String cust_id = rs.getString("customer_id");
                        String prod_id = rs.getString("product_id");
                        String store_id = rs.getString("store_id");
                        String store_name = rs.getString("store_name");
                        String time_id = rs.getString("time_id");
                        // date
                        String d = rs.getString("t_date");
                        // yyyy-mm-dd
                        String year = d.substring(0, 4);
                        String month = d.substring(5, 7);
                        String day = d.substring(8, 10);
                        String quarter = "";
                        if (month.equals("01") || month.equals("02") || month.equals("03")) {
                            quarter = "1";
                        } else if (month.equals("05") || month.equals("06") || month.equals("07")) {
                            quarter = "2";
                        } else if (month.equals("07") || month.equals("08") || month.equals("09")) {
                            quarter = "3";
                        } else {
                            quarter = "4";
                        }
                        String week = "";
                        // day is 1-7 it's week 1
                        if (day.equals("01") || day.equals("02") || day.equals("03") || day.equals("04")
                                || day.equals("05") || day.equals("06") || day.equals("07")) {
                            week = "1";
                        } else if (day.equals("08") || day.equals("09") || day.equals("10") || day.equals("11")
                                || day.equals("12") || day.equals("13") || day.equals("14")) {
                            week = "2";
                        } else if (day.equals("15") || day.equals("16") || day.equals("17") || day.equals("18")
                                || day.equals("19") || day.equals("20") || day.equals("21")) {
                            week = "3";
                        } else if (day.equals("22") || day.equals("23") || day.equals("24") || day.equals("25")
                                || day.equals("26") || day.equals("27") || day.equals("28")) {
                            week = "4";
                        } else {
                            week = "5";
                        }

                        int quantity = rs.getInt("quantity");

                        // create a temp map to store the above variables
                        HashMap<String, String> temp_map = new HashMap<String, String>();
                        temp_map.put("trans_id", trans_id);
                        temp_map.put("cust_id", cust_id);
                        temp_map.put("prod_id", prod_id);
                        temp_map.put("store_id", store_id);
                        temp_map.put("store_name", store_name);
                        temp_map.put("time_id", time_id);
                        temp_map.put("date", d);
                        temp_map.put("year", year);
                        temp_map.put("month", month);
                        temp_map.put("day", day);
                        temp_map.put("quarter", quarter);
                        temp_map.put("week_num", week);
                        temp_map.put("quantity", Integer.toString(quantity));

                        // insert the temp map into the value of key of map
                        // create array to store time_id,key
                        ArrayList<String> time_key = new ArrayList<String>();
                        time_key.add(time_id);
                        time_key.add(key);
                        map.put(time_key, temp_map);
                    }
                    queue.add(map);
                }
                // loop while queue is not empty
                while (!queue.isEmpty()) {

                    // read transactions in a loop from db
                    map = queue.poll();

                    // read customer from md iteratively
                    for (int j = 0; j < num_cus; j += 100) {
                        String q = "SELECT * FROM customers LIMIT " + j + ",100";
                        rs = stmtMD.executeQuery(q);
                        // create a map to store the customer info
                        HashMap<String, String> cus_map = new HashMap<String, String>();
                        while (rs.next()) {
                            String cus_id = rs.getString("customer_id");
                            String cus_name = rs.getString("customer_name");
                            cus_map.put(cus_id, cus_name);
                        }

                        // loop through each cus_id
                        for (String cust_id : cus_map.keySet()) {
                            // read product from md iteratively
                            for (int k = 0; k < num_prods; k += 100) {
                                String q2 = "SELECT * FROM products LIMIT " + k + ",100";
                                rs = stmtMD.executeQuery(q2);

                                // create a map to store the product info
                                // hashmap of string key and list as value
                                HashMap<String, List<String>> prod_map = new HashMap<String, List<String>>();
                                while (rs.next()) {
                                    String prod_id = rs.getString("product_id");
                                    String prod_name = rs.getString("product_name");
                                    String prod_price = rs.getString("price");
                                    String supplier_id = rs.getString("supplier_id");
                                    String supplier_name = rs.getString("supplier_name");
                                    prod_map.put(prod_id,
                                            Arrays.asList(prod_name, prod_price, supplier_id, supplier_name));
                                }
                                for (String prod_id : prod_map.keySet()) {
                                    // check if the key exists in map
                                    String key = cust_id + " " + prod_id;
                                    // for loop to enter product info and customer info to every key who's second
                                    // element is equal to key
                                    for (ArrayList<String> time_key : map.keySet()) {
                                        if (time_key.get(1).equals(key)) {
                                            // get customer name
                                            String cust_name = cus_map.get(cust_id);
                                            // get product info
                                            List<String> prod_info = prod_map.get(prod_id);
                                            String prod_name = prod_info.get(0);
                                            String prod_price = prod_info.get(1);
                                            String supplier_id = prod_info.get(2);
                                            String supplier_name = prod_info.get(3);

                                            HashMap<String, String> tmap = map.get(time_key);

                                            // insert the values from md into the value of the key
                                            tmap.put("cust_name", cust_name);
                                            tmap.put("prod_price", prod_price);
                                            tmap.put("prod_name", prod_name);
                                            tmap.put("supplier_id", supplier_id);
                                            tmap.put("supplier_name", supplier_name);
                                            // sales
                                            Double sales = Double.parseDouble(prod_price)
                                                    * Double.parseDouble(tmap.get("quantity"));
                                            tmap.put("sales", Double.toString(sales));
                                            // insert the value back into the map
                                            ArrayList<String> ty = new ArrayList<String>();
                                            ty.add(tmap.get("time_id"));
                                            ty.add(key);
                                            map.put(ty, tmap);
                                        }

                                    }
                                }
                            }
                        }
                    }

                    // run thread
                    MyClass obj = new MyClass();
                    obj.run(map, connDW);

                }
                System.out.println("Done!");
            } else {
                System.out.println("Connection Failed.");
            }
        } catch (

        Exception e) {
            e.printStackTrace();
        }
    }
}
