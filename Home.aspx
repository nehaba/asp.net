<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Eshopper_Project.Home" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Home Page</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section>
        <div>
            <img class="img-responsive margin-top" src="images/banner.jpg" />
        </div>
    </section>

    <div class="container-fluid media_object">
        <div class="container  margin_top">
            <div class="row">
                <div class="col-sm-4 col-xs-12">
                    <div class="media">
                        <div class="media-left">
                            <a href="#">
                                <img class="delivery" /></a>
                        </div>
                        <div class="media-body">
                            <p class="font" style="margin-left: 10px;">Free delivery worldwide</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-xs-12">
                    <div class="media">
                        <div class="media-left">
                            <a href="#">
                                <img class="return"></a>
                        </div>
                        <div class="media-body">
                            <p class="font" style="margin-left: 10px;">Free return for 90 days</p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-xs-12">
                    <div class="media">
                        <div class="media-left">
                            <a href="#">
                                <img class="coupan" /></a>
                        </div>
                        <div class="media-body">
                            <p class="font" style="margin-left: 10px;">discount on order gift</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <section class="container">
        <div class="row" style="align-content: center;">
            <div class="col-sm-12 col-xs-12 text-center">
                <h1 class="heading text-center">Trending Product</h1>
            </div>
        </div>
        
        <div class="row">
            
                <asp:DataList ID="dlProduct" runat="server" RepeatDirection="Horizontal" RepeatColumns="4" OnItemCommand="dlProduct_ItemCommand">
                    <ItemTemplate>
                        <div class="show-image">
                            <asp:HiddenField ID="hdnId" runat="server" Value='<%#Eval("ID") %>' />
                            <img class="image" src="<%# Eval("ImageUrl") %>" style="height: 350px; width: 280px" />
                            <asp:Button ID="btnCart" class="update" runat="server" Text="ADD TO CART" CommandName="cart"/>
                        </div>
                        <asp:HyperLink ID="hlProduct" class="items caption" runat="server" href="ProductDetail.aspx" Text='<% #Eval("Name")%>' /></br>
                        <asp:Label class="items caption" ID="lblPrice" runat="server" CssClass="color_red" Text='<% #Eval("Price")%>'></asp:Label>
                    </ItemTemplate>
                </asp:DataList>
            
        </div>
        
        <div class="row">
            <div class="col-xs-12" style="text-align: center">
                <asp:Button ID="btnMoreProduct" CssClass="sign_up" Text="More Products" runat="server" />
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12" style="text-align: center">
                <asp:Label ID="label1" runat="server" />
            </div>
        </div>
    </section>

    <section>
        <div class="footer_img">
            <img class="img-responsive image" src="images/px.jpg" />
            <div class="footer_img_text">
                <p>
                    <b>GET THE</b> LATEST<br />
                    <b>WOMEN</b> FASHION
                </p>
                <button type="submit" class="sign_up">Get Exclusive Collection For Women</button>
            </div>
        </div>
    </section>
</asp:Content>
