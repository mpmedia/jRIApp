﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RIAppDemo.Models
{
    public class SPATemplate
    {
        public SPATemplate() 
        {
            this.BindGridCustomers = "{this.dataSource,to=dbSet,source=VM.customerVM}{this.propChangedCommand,to=propChangeCommand,source=VM.customerVM}";
            this.OptionsGridCustomers = "options={wrapCss:customerTableWrap,isHandleAddNew:true,editor:{templateID:customerEditTemplate,width:500,height:550,title:'Customer editing'},details:{templateID:customerDetailsTemplate}}";

            this.BindTableCustOrders = "{this.dataSource,to=dbSet,source=VM.customerVM.ordersVM}{this.propChangedCommand,to=propChangeCommand,source=VM.customerVM.ordersVM}";
            this.OptionsTableCustOrders = "options={isUseScrollIntoDetails:false,isHandleAddNew:true,editor:{templateID:orderEditTemplate,width:650,height:550,title:'Order editing'},details:{templateID:orderDetailsTemplate}}";

            this.BindAddNewOrder = "{this.command,to=addNewCommand,source=VM.customerVM.ordersVM}";
            this.OptionsAddNewOrder = "options={tip:This is not a Real World example how to add an order!!!}";
        }

        public string BindGridCustomers {get; set;}
        public string OptionsGridCustomers { get; set; }

        public string BindTableCustOrders { get; set; }
        public string OptionsTableCustOrders { get; set; }

        public string BindAddNewOrder { get; set; }
        public string OptionsAddNewOrder { get; set; }
    }
}