<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Eshopper_Project.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="alert alert-success alert-dismissible">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
            <div class="media">
                <div class="media-left">
                    <img src="images/success.svg" class="svg_size" />
                </div>
                <div class="media-body">
                    <strong>Success!</strong> U.S. polo assn. full sleev plain tshirt for man was added to your shopping cart
                </div>
            </div>
        </div>
        <div class="alert alert-info alert-dismissible">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
            <div class="media">
                <div class="media-left">
                    <img src="images/info.svg" class="svg_size" />
                </div>
                <div class="media-body">
                    <strong>Info!</strong> U.S. polo assn. full sleev plain tshirt for man was added to your shopping cart
                </div>
            </div>
        </div>
        <div class="alert alert-warning alert-dismissible">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
            <div class="media">
                <div class="media-left">
                    <img src="images/warning.svg" class="svg_size" />
                </div>
                <div class="media-body">
                    <strong>Warning!</strong> U.S. polo assn. full sleev plain tshirt for man was added to your shopping cart
                </div>
            </div>
        </div>
        <div class="alert alert-danger alert-dismissible">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
            <div class="media">
                <div class="media-left">
                    <img src="images/error.svg" class="svg_size" />
                </div>
                <div class="media-body">
                    <strong>Danger!</strong> U.S. polo assn. full sleev plain tshirt for man was added to your shopping cart
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="table-responsive">

            <asp:Repeater ID="rptCart" runat="server" OnItemCommand="rptCart_ItemCommand">
                <HeaderTemplate>
                    <table class="table" id="tblProductDetail">
                        <thead>
                            <tr style="background-color: #f5f5f5">
                                <th scope="col"></th>
                                <th scope="col">Product Name</th>
                                <th scope="col">Unit Prize</th>
                                <th scope="col">Qty</th>
                                <th scope="col">SubTotal</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                </HeaderTemplate>

                <ItemTemplate>
                    <tbody id="tblProductBody">
                        <tr>
                            <th scope="row">
                                <img src="<%# Eval("ImageUrl") %>" style="height: 94px; width: 75px" />
                            </th>
                            <td>
                                <asp:HiddenField ID="hdnId" runat="server" Value='<%#Eval("ID") %>' />
                                <asp:HyperLink ID="hlItemName" runat="server" Text='<% #Eval("Name")%>' /><br/>
                                <asp:Label ID="lblColor" runat="server" Text="Color"></asp:Label><br/>
                                <asp:Label ID="lblColorName" runat="server" Text='<% #Eval("colour")%>'></asp:Label><br/>
                                <asp:Label ID="lblSize" runat="server" Text="size"></asp:Label><br/>
                                <asp:Label ID="lblSizeName" runat="server" Text='<% #Eval("size")%>'></asp:Label>
                            </td>
                            <td class="color_red prize">
                                <asp:Label ID="lblPrize" runat="server" Text='<% #Eval("Price")%>'></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox TextMode="Number" min="0" max="10" name="qty" ID="txtQty" Text='<% #Eval("Qty")%>' Style="width: 30px;" runat="server" OnTextChanged="txtQty_TextChanged"/>
                            </td>
                            <td class="color_red finalTotal total">
                                <asp:Label ID="lblTotalPrize" runat="server" Text='<% #Eval("subtotal")%>'></asp:Label>
                            </td>
                            <td>
                                <asp:ImageButton ID="btnCross" runat="server" ImageUrl="images/cross-dark.svg" class="svg_size mouse_hover delete_item" CommandName="delete"/>
                            </td>
                        </tr>
                    </tbody>
                </ItemTemplate>

                <FooterTemplate>
                    <tr style="background-color: #f5f5f5">
                        <td colspan="2">
                            <asp:Button class="cart_button" ID="btnContinueShopping" Text="Continue Shopping" runat="server" CommandName="Continue"/>
                        </td>
                        <td colspan="4" style="text-align: right;">
                            <asp:Button class="cart_button" ID="btnClearCart" Text="Clear Shopping Cart" runat="server" CommandName="clearAll"/>
                        </td>
                    </tr>
                    </table>
                </FooterTemplate>
            </asp:Repeater>

        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-sm-4"></div>
            <div class="col-sm-4"></div>
            <div class="col-sm-4 col-xs-12">
                <table class="table table-bordered table-responsive" style="table-align: right !important;" id="tblUpdate">
                    <tbody>
                        <tr class="text-right" id="tblUpdateRow1">
                            <td class="table_border"></td>
                            <td class="table_border">SubTotal</td>
                            <td class="table_border subtotal"><b><asp:Label ID="lblSubtotal" runat="server" Text=""></asp:Label></b></td>
                        </tr>
                        <tr class="text-right" id="tblUpdateRow2">
                            <td class="table_border"></td>
                            <td class="table_border">Total</td>
                            <td class="table_border color_red subtotal" id="subtotal"><b><asp:Label ID="lblTotal" runat="server" Text=""></asp:Label></b></td>
                        </tr>
                        <tr id="tblUpdateRow3">
                            <td colspan="3" class="text-right table_border">
                                <asp:Button class="update_cart" ID="btnUpdateCart" Text="Update Shopping Cart" runat="server" OnClick="btnUpdateCart_Click"/>
                            </td>
                        </tr>
                        <tr id="tblUpdateRow4">
                            <td colspan="3" class="text-center">
                                <asp:Button class="update_cart" ID="btnCheckoutCart" Text="checkout" runat="server"/>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
