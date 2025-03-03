<%@ Page Title="Announcments :: FEA" Language="C#" MasterPageFile="~/Account/Project-Team/MasterPage.master" AutoEventWireup="true" CodeFile="Announcements.aspx.cs" Inherits="student_Subject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 80px;
            color: #FF0000;
        }

        .auto-style4 {
            width: 20px;
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
            <h3 class="title1">Announcements</h3>
            <asp:Label ID="lblGMsg" runat="server" ForeColor="red"></asp:Label>
            <div class="sign-up-row widget-shadow">
                <div class="form-body" data-example-id="simple-form-inline">
                    <div class="row-one">
                        <div class="row">
                            <div class="col-lg-12">
                                <section class="panel">
                                    <div class="panel-body">
                                        <div class="position-center">
                                            <div class="form-group">
                                                <asp:Repeater ID="Order" runat="server" OnItemDataBound="Order_ItemDataBound">
                                                    <ItemTemplate>
                                                        <table class="nav-justified">
                                                            <tr>
                                                                <td>
                                                                    <asp:HiddenField ID="hfThreadId" runat="server" Value='<%# Eval("Id") %>' />
                                                                    <asp:Label ID="lblAnn" runat="server" Text='<%# Eval("Name") %>' CssClass="auto-style2" />
                                                                    <asp:Label ID="Label3" runat="server" Text='(' CssClass="auto-style2" />
                                                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("Email") %>' CssClass="auto-style2" />
                                                                    <asp:Label ID="Label7" runat="server" Text=')' CssClass="auto-style2" />&nbsp;&nbsp;-&nbsp;&nbsp;
                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Date") %>' ForeColor="#65b8cb" Font-Bold="true" />
                                                                    <br />
                                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Message") %>' />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <br />
                                                        <table class="nav-justified">
                                                            <tr>
                                                                <td class="auto-style4"></td>
                                                                <td>
                                                                    <asp:Repeater ID="rptOrders" runat="server">
                                                                        <ItemTemplate>
                                                                            <table class="nav-justified">
                                                                                <tr>
                                                                                    <td>
                                                                                        <asp:HiddenField ID="hfThreadId" runat="server" Value='<%# Eval("Id") %>' />
                                                                                        <asp:HiddenField ID="hfThreadId1" runat="server" Value='<%# Eval("ThreadId") %>' />
                                                                                        <asp:Label ID="lblAnn" runat="server" Text='<%# Eval("Name") %>' CssClass="auto-style2" />
                                                                                        <asp:Label ID="Label3" runat="server" Text='(' CssClass="auto-style2" />
                                                                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("Email") %>' CssClass="auto-style2" />
                                                                                        <asp:Label ID="Label7" runat="server" Text=')' CssClass="auto-style2" />&nbsp;&nbsp;-&nbsp;&nbsp;
                                                                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Date") %>' ForeColor="#65b8cb" Font-Bold="true" CssClass="auto-style2" />
                                                                                        <br />
                                                                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("Message") %>' />
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                            <br />
                                                                        </ItemTemplate>
                                                                    </asp:Repeater>
                                                                </td>
                                                            </tr>
                                                        </table>
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
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>


</asp:Content>

