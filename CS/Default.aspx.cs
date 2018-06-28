using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page {
    GridDataHelper helper = new GridDataHelper();
    protected void Page_Init(object sender, EventArgs e) {
        if (!IsPostBack)
            Session.Clear();
        helper.BindGrids(GridFrom, GridTo);
    }
    protected void cbPanel_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e) {
        var rowKey = e.Parameter.Split('|')[0];
        var leftToRight = Convert.ToBoolean(e.Parameter.Split('|')[1]);

        var source = leftToRight ? helper.GetDraggableDataSource() : helper.GetDroppableDataSource();
        var target = leftToRight ? helper.GetDroppableDataSource() : helper.GetDraggableDataSource();

        //update target datasource
        var sourceRow = source.AsEnumerable()
            .Where(x => x.Field<int>("CategoryID") == Convert.ToInt32(rowKey))
            .SingleOrDefault();
        target.ImportRow(sourceRow);

        //remove source data
        source.Rows.Remove(sourceRow);

        GridFrom.DataBind();
        GridTo.DataBind();
    }

    protected void GridFrom_HtmlCardPrepared(object sender, DevExpress.Web.ASPxCardViewHtmlCardPreparedEventArgs e)
    {
        ASPxCardView cardView = sender as ASPxCardView;
        var key = cardView.GetCardValues(e.VisibleIndex, cardView.KeyFieldName);
        e.Card.CssClass += string.Format(" cardKey_{0}", key);
    }

    protected void GridTo_HtmlCardPrepared(object sender, DevExpress.Web.ASPxCardViewHtmlCardPreparedEventArgs e)
    {
        ASPxCardView cardView = sender as ASPxCardView;
        var key = cardView.GetCardValues(e.VisibleIndex, cardView.KeyFieldName);
        e.Card.CssClass += string.Format(" cardKey_{0}", key);
    }
}