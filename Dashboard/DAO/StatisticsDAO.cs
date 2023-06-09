﻿using Dashboard.DAO;
using Dashboard.DTO;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Dashboard
{
    public class StatisticsDAO
    {
        private static string strSQL = "";
        private static SqlParameter parameter;
        private static List<SqlParameter> parameters;
        private static StatisticsDAO instance;

        public static StatisticsDAO Instance
        {
            get { if (instance == null) instance = new StatisticsDAO(); return instance; }
            private set { instance = value; }
        }

        private StatisticsDAO() { }

        public DataTable GetTop5Product(DateTime begin, DateTime end, ref string err)
        {
            string query = "SELECT * FROM dbo.FUNC_TOP5_PRODUCT ( @Daystart , @Dayend )";
            object[] parameters = new object[] { begin, end };
            DataTable dt = DataProvider.Instance.ExecuteQuery(query, parameters);
            err = "";
            return dt;
        }

        public DataTable GetTop5MinProduct(DateTime begin, DateTime end, ref string err)
        {
            string query = "SELECT * FROM dbo.FUNC_BOTTOM5_PRODUCT ( @Daystart , @Dayend )";
            object[] parameters = new object[] { begin, end };
            DataTable dt = DataProvider.Instance.ExecuteQuery(query, parameters);
            err = "";
            return dt;
        }

        public int GetTotalBill(DateTime begin, DateTime end, ref string err)
        {

            string query = "SELECT dbo.FUNC_TOTAL_COMPLETE_BILL ( @Daystart , @Dayend )";
            object[] parameters = new object[] { begin, end };
            int result = 0;
            try
            {
                object o = DataProvider.Instance.ExecuteScalar(query, parameters);

                if (o != null)
                {
                    result = Convert.ToInt32(o);
                }
            }
            catch (SqlException ex)
            {
                err = ex.Message;
                result =  0;
            }
            return result;

        }

        public int GetTotalProduct(DateTime begin, DateTime end, ref string err)
        {

            string query = "SELECT dbo.FUNC_TOTAL_COMPLETE_BILL_COMPONENT ( @Daystart , @Dayend )";
            object[] parameters = new object[] { begin, end };
            int result = 0;
            try
            {
                object o = DataProvider.Instance.ExecuteScalar(query, parameters);

                if (o != null)
                {
                    result = Convert.ToInt32(o);
                }
            }
            catch (SqlException ex)
            {
                err = ex.Message;
                result =  0;
            }
            return result;

        }

        public int GetTotalRevenue(DateTime begin, DateTime end, ref string err)
        {
            string query = "SELECT dbo.FUNC_TOTAL_REVENUE ( @Daystart , @Dayend )";
            object[] parameters = new object[] { begin.Date, end.Date };
            int result = 0;
            try
            {
                object o = DataProvider.Instance.ExecuteScalar(query, parameters);
                
                if (o != null) {
                    result = Convert.ToInt32(o);
                }
            }
            catch (SqlException ex)
            {
                err = ex.Message;
                result =  0;
            }
            return result;
            
        }

        public DataTable GetRevenueByDate (DateTime begin, DateTime end, ref string err)
        {
            string query = "SELECT * FROM dbo.FUNC_REVENUE_SPLINE ( @Daystart , @Dayend )";
            object[] parameters = new object[] { begin, end };
            DataTable dt = DataProvider.Instance.ExecuteQuery(query, parameters);
            err = "";
            return dt;
        }
    }
}
