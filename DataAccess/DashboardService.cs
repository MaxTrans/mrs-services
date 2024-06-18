using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Metadata.Ecma335;
using System.Text;
using System.Threading.Tasks;
using BusinessEntity;
using DataAccess.Base;
using static DataAccess.Procedures;

namespace DataAccess
{
    public class DashboardService: DataContext
    {
        public DashboardService()
        {
                
        }

        public List<DashboardInfo> GetDashboardList(string? userId)
        {

            this.ProcedureName = Procedures.Dashboard.USP_DASHBOARD;
            this.AddParameter("@UserId", string.IsNullOrEmpty(userId) ? DBNull.Value : userId);

            var dashboardList = new List<DashboardInfo>();

            var dbresult = this.ExecuteReader((dr) => {

                dashboardList.Add(new DashboardInfo
                {
                    RecordCount = dr["RecCount"].ToInt(),
                    Color = dr["Color"].ToStr(),
                    Icon = dr["Icon"].ToStr(),
                    Title = dr["Title"].ToStr(),
                    Link = dr["Link"].ToStr(),
                    SortOrder = dr["RecCount"].ToInt()
                });
                
            });

            return dashboardList;
        }

    }
}
