<%@ Page Title="Task Details :: FEA" Language="C#" MasterPageFile="~/Account/Project-Team/MasterPage.master" AutoEventWireup="true" CodeFile="TaskDetails.aspx.cs" Inherits="Purchase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 80px;
            color: #FF0000;
        }

        .auto-style4 {
            width: 120px;
            color: #FF0000;
        }

        .auto-style2 {
            color: #33848c;
            font-weight: bolder;
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div id="page-wrapper">
        <div class="main-page signup-page">
            <h3 class="title1">
                <asp:Label Text="" runat="server" ID="lblTaskName"></asp:Label></h3>
            <asp:Label ID="lblGMsg" runat="server" ForeColor="red"></asp:Label>

            <div class="sign-up-row widget-shadow">

                <div class="form-body" data-example-id="simple-form-inline">
                    <asp:Repeater ID="r1" runat="server">
                        <ItemTemplate>
                            <div class="col-md-6">
                                <h2>Task Details</h2>
                            </div>
                            <div class="col-md-6" style="text-align: right; font-size: x-large"><b>Deadline : </b><%# Eval("Deadline")%></div>
                            <p>
                                <br />
                                <hr />
                            </p>
                            <div class="clearfix"></div>
                            <div class="col-md-6" style="text-align: left">
                                <b>Task Name: </b><%# Eval("Name")%><br />
                                <b>Assigned To: </b><%# Eval("AssignedTo")%><br />
                                <b>Task Created On: </b><%# Eval("DateCreated")%><br />
                                <br />

                            </div>
                            <div class="col-md-6" style="text-align: left">

                                <b>Milestone: </b><%# Eval("MilestoneName")%>
                                <br />
                                <b>Milestone Description: </b><%# Eval("MilestoneDescription")%>
                                <br />
                            </div>
                            <div class="col-md-12" style="text-align: left">
                                <b>Task Description<br />
                                </b><%# Eval("Description")%><br />
                            </div>
                            <div class="clearfix"></div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <div class="col-md-12" style="text-align: center">

                        <hr />
                        <asp:Label runat="server" ID="lblRequest" Text="" Font-Bold="true" ForeColor="Red"></asp:Label>
                        <br />
                        <asp:Label runat="server" ID="lblStatus" Text="" Font-Bold="true" ForeColor="Red"></asp:Label><br />
                        <br />
                        <asp:Button runat="server" Text="Close Task" OnClick="btnCloseTasks_Click" ID="btnCloseTasks" ValidationGroup="q1" class="btn btn-success" />
                        <br />
                        <br />
                        <hr />
                    </div>
                    <div class="row">
                        <h2 style="text-align: center">&nbsp; Discussion Forum </h2>
                        <br />

                        <div class="panel-body">
                            <div class="position-center">
                                <div class="form-group">
                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtDF" Display="Dynamic" ErrorMessage="*" ForeColor="Red" ValidationGroup="q1"></asp:RequiredFieldValidator>--%>
                                    <asp:TextBox ID="txtDF" runat="server" Class="form-control" TextMode="MultiLine" Height="80px" Width="100%" placeholder="Open a new thread..."></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:Button runat="server" Text="Submit" OnClick="btnSubmit_Click" ID="btnSubmmit" ValidationGroup="q1" class="btn btn-success" />
                                    <br />
                                    <br />
                                    <asp:Label ID="lblError" runat="server" Text="" CssClass="auto-style1"></asp:Label>
                                    <asp:Label ID="lblMessage" runat="server" Text="" CssClass="auto-style1"></asp:Label>
                                </div>
                            </div>
                            
                        </div>

                        <div class="row">
                            <div class="col-lg-12">
                                <section class="panel">

                                    <div class="panel-body">
                                        <div class="position-center">

                                            <div class="form-group">
                                                <asp:Repeater ID="Order" runat="server" OnItemDataBound="Order_ItemDataBound" OnItemCommand="Order_ItemCommand">
                                                    <ItemTemplate>

                                                        <table class="nav-justified">
                                                            <tr>
                                                                <td class="auto-style1">
                                                                    <asp:Image runat="server" ID="img" ImageUrl="~/images/images.png" ToolTip="" /></td>

                                                                <td>
                                                                    <asp:HiddenField ID="hfThreadId" runat="server" Value='<%# Eval("Id") %>' />
                                                                    <asp:Label ID="lblAnn" runat="server" Text='<%# Eval("Name") %>' CssClass="auto-style2" />
                                                                    -                                                                   
                                                                    <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>' CssClass="auto-style2" />
                                                                    <br />
                                                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Date") %>' ForeColor="#65b8cb" Font-Bold="true" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <table class="nav-justified">
                                                            <tr>
                                                                <td class="auto-style1"></td>
                                                                <td>

                                                                    <br />
                                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Message") %>' />


                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <br />
                                                        <br />
                                                        <table class="nav-justified">
                                                            <tr>
                                                                <td class="auto-style4"></td>
                                                                <td>
                                                                    <div class="form-group">
                                                                        <asp:TextBox ID="txtReply" runat="server" Class="form-control" TextMode="MultiLine" Row="6" Width="100%" Placeholder="Reply here..."></asp:TextBox>

                                                                        <asp:Label runat="server" ID="lblReplyErroe"></asp:Label>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <asp:Button runat="server" CommandArgument='<%#Eval("Id") %>' CommandName="Submit" Text="Reply" ID="btnSubmit" class="btn btn-success" />
                                                                        <br />
                                                                        <br />
                                                                        <asp:Label ID="lblError" runat="server" Text="" CssClass="auto-style1"></asp:Label>
                                                                        <asp:Label ID="lblMessage" runat="server" Text="" CssClass="auto-style1"></asp:Label>
                                                                    </div>

                                                                </td>


                                                            </tr>

                                                        </table>
                                                        <br />
                                                        <br />
                                                        <asp:Repeater ID="rptOrders" runat="server">
                                                            <ItemTemplate>
                                                                <table class="nav-justified">
                                                                    <tr>
                                                                        <td class="auto-style4" style="text-align: right">
                                                                            <asp:Image runat="server" ID="img" ImageUrl="~/images/replyyfirst.png" ToolTip="" />&nbsp;&nbsp;&nbsp;</td>
                                                                        <td>
                                                                            <asp:HiddenField ID="hfThreadId" runat="server" Value='<%# Eval("Id") %>' />
                                                                            <asp:HiddenField ID="hfThreadId1" runat="server" Value='<%# Eval("ThreadId") %>' />
                                                                            <asp:Label ID="lblAnn" runat="server" Text='<%# Eval("Name") %>' CssClass="auto-style2" />
                                                                            -                                                                             
                                                                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("Email") %>' CssClass="auto-style2" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <table class="nav-justified">
                                                                    <tr>
                                                                        <td class="auto-style4"></td>
                                                                        <td>
                                                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Date") %>' ForeColor="#65b8cb" Font-Bold="true" />
                                                                            <br />

                                                                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("Message") %>' />

                                                                            <asp:Repeater ID="DiscussionImage1" runat="server">
                                                                                <ItemTemplate>
                                                                                    <br />
                                                                                    <img class="img-responsive" src='data:Images/jpg;base64,<%# Eval("ReplyImage") != System.DBNull.Value ? Convert.ToBase64String((byte[])Eval("ReplyImage")) : string.Empty %>' alt="image" style="height: 200px; width: 400px;" />
                                                                                </ItemTemplate>
                                                                            </asp:Repeater>
                                                                        </td>

                                                                    </tr>

                                                                </table>
                                                                <br />
                                                                <br />
                                                            </ItemTemplate>
                                                        </asp:Repeater>



                                                    </ItemTemplate>

                                                    <FooterTemplate>

                                                        <div id="dvNoRecords" runat="server" visible="false" style="padding: 20px 20px; text-align: center; color: Red;">
                                                            <img src="../../images/DiscussionForum.png" />
                                                        </div>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </div>


                                        </div>
                                    </div>
                                </section>
                            </div>
                        </div>




                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

