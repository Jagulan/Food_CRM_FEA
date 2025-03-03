<%@ Page Title="Ticket :: FEA" Language="C#" MasterPageFile="~/Account/Project-Team/MasterPage.master" AutoEventWireup="true" CodeFile="Ticket.aspx.cs" Inherits="Purchase" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="page-wrapper">
        <div class="main-page signup-page">
            <h3 class="title1">
                <asp:Label Text="" runat="server" ID="lblCompanyName"></asp:Label></h3>
            <asp:Label ID="lblGMsg" runat="server" ForeColor="red"></asp:Label>

            <div class="sign-up-row widget-shadow">

                <div class="form-body" data-example-id="simple-form-inline">
                    <asp:Repeater ID="r1" runat="server">
                        <ItemTemplate>

                            <div class="col-md-6">
                                <br />
                                <h2>Ticket</h2>

                            </div>

                            <div class="col-md-6" style="text-align: right">

                                <a href="RaiseTicket.aspx?ProjectId=<%# Eval("Id")%>" class="btn btn-default" />Raise Tickets</a>
                             &nbsp;|&nbsp;
                                   <a href="ViewProject.aspx?ProjectId=<%# Eval("Id")%>" class="btn btn-primary" />Project Details</a>
                                

                            </div>


                        </ItemTemplate>
                    </asp:Repeater>
                    <br />
                    <div class="form-inline">
                        <div class="form-group">
                            <asp:Label ID="lblMsg" runat="server" ForeColor="red" Font-Bold="true"></asp:Label>
                        </div>
                        <hr />
                        <div class="row-one">
                            <div class="col-md-12">
                                <table style="width: 100%">

                                    <tr style="font-weight: bold">
                                        <td style="width: 20%">Name </td>
                                        <td style="width: 20%">Raised On</td>
                                        <td style="width: 20%">Raised By</td>
                                        <td style="width: 20%">Priority</td>
                                        <td style="width: 20%">Status</td>

                                    </tr>
                                </table>

                                <asp:Repeater ID="r2" runat="server">
                                    <ItemTemplate>
                                        <a href="TicketDetails.aspx?TicketId=<%# Eval("Id")%>">
                                            <table style="width: 100%">
                                                <tr>
                                                    <td style="width: 20%"><%# Eval("Name") %></td>
                                                    <td style="width: 20%"><%# Eval("DateCreated") %> </td>
                                                    <td style="width: 20%"><%# Eval("RaisedBy") %></td>
                                                    <td style="width: 20%"><%# Eval("Priority") %></td>
                                                    <td style="width: 20%"><%# Eval("Status") %></td>


                                                </tr>
                                            </table>
                                        </a>



                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

