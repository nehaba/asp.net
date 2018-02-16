<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Eshopper_Project.Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Product Page</title>
    <link rel="stylesheet" href="css/nouislider.min.css" />
    <script src="js/nouislider.min.js"></script>
    <script>
        $(document).ready(function () {
            var startSlider = document.getElementById('slider-start');

            noUiSlider.create(startSlider, {
                start: [0, 100],
                range: {
                    'min': [0],
                    'max': [100]
                }
            });
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="container">

        <div class="col-sm-3">
            <div class="menu_border">
                <div class="menu_heading">FILTER BY</div>
                <div class="panel-group" id="accordion">
                    <div>
                        <div class="panel-heading">
                            <h4 class="panel-title">CATEGORIES
                                <a data-toggle="collapse" class="float_right" data-parent="#accordion" href="#collapse1">
                                    <img class="col_in" /></a>
                            </h4>
                        </div>
                        <div id="collapse1" class="panel-collapse collapse in">
                            <div class="panel-body" style="border-top: none;">
                                <asp:GridView ID="gridCategory" runat="server" OnRowDataBound="gridCategory_RowDataBound" GridLines="None">
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:HiddenField ID="hdnCategory" runat="server" value='<%# Eval("CategoryId") %>'/>
                                                <asp:CheckBox ID="chkCategory" runat="server" Text='<%# Eval("DisplayCat") %>'/>
                                                <%--<asp:Label ID="lblCategoryName" runat="server" Text='<%# Eval("DisplayCat") %>'></asp:Label>--%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <%--<asp:CheckBoxList ID="categories" runat="server">
                                    <asp:ListItem Value="" runat="server">
                                        T-shirts(25275)
                                    </asp:ListItem>
                                    <asp:ListItem Value="" runat="server">Shirts(24866)</asp:ListItem>
                                    <asp:ListItem Value="" runat="server">Jackets(5326)</asp:ListItem>
                                    <asp:ListItem Value="" runat="server">Sweaters(4871)</asp:ListItem>
                                    <asp:ListItem Value="" runat="server">Sweatshirts(4533)</asp:ListItem>
                                    <asp:ListItem Value="" runat="server">Kurtas(1566)</asp:ListItem>
                                </asp:CheckBoxList>--%>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <div>
                        <div class="panel-heading">
                            <h4 class="panel-title">COLOURS
                                <a data-toggle="collapse" class="float_right" data-parent="#accordion" href="#collapse2">
                                    <img class="col_in" /></a>
                            </h4>
                        </div>
                        <div id="collapse2" class="panel-collapse collapse in">
                            <div class="panel-body" style="border-top: none;">
                                <div class="row">
                                    <div style="display: inline-block;">
                                        <svg width="30" height="20">
                                            <circle cx="20" cy="10" r="10"
                                                fill="magenta" />
                                        </svg>
                                    </div>
                                    <div style="display: inline-block;">Megenta</div>
                                </div>
                                <div class="row">
                                    <div style="display: inline-block;">
                                        <svg width="30" height="20">
                                            <circle cx="20" cy="10" r="10"
                                                fill="pink" />
                                        </svg>
                                    </div>
                                    <div style="display: inline-block;">Pink(150)</div>
                                </div>
                                <div class="row">
                                    <div style="display: inline-block;">
                                        <svg width="30" height="20">
                                            <circle cx="20" cy="10" r="10"
                                                fill="red" />
                                        </svg>
                                    </div>
                                    <div style="display: inline-block;">Red(100)</div>
                                </div>
                                <div class="row">
                                    <div style="display: inline-block;">
                                        <svg width="30" height="20">
                                            <circle cx="20" cy="10" r="10"
                                                fill="lavender" />
                                        </svg>
                                    </div>
                                    <div style="display: inline-block;">Lavender(250)</div>
                                </div>
                                <div class="row">
                                    <div style="display: inline-block;">
                                        <svg width="30" height="20">
                                            <circle cx="20" cy="10" r="10"
                                                fill="navy" />
                                        </svg>
                                    </div>
                                    <div style="display: inline-block;">Navy(50)</div>
                                </div>
                                <div class="row">
                                    <div style="display: inline-block;">
                                        <svg width="30" height="20">
                                            <circle cx="20" cy="10" r="10"
                                                fill="blue" />
                                        </svg>
                                    </div>
                                    <div style="display: inline-block;">Blue(1220)</div>
                                </div>
                                <div class="row">
                                    <div style="display: inline-block;">
                                        <svg width="30" height="20">
                                            <circle cx="20" cy="10" r="10"
                                                fill="grey" />
                                        </svg>
                                    </div>
                                    <div style="display: inline-block;">Grey(2250)</div>
                                </div>
                                <div class="row">
                                    <div style="display: inline-block;">
                                        <svg width="30" height="20">
                                            <circle cx="20" cy="10" r="10"
                                                fill="teal" />
                                        </svg>
                                    </div>
                                    <div style="display: inline-block;">Teal(1350)</div>
                                </div>
                                <div class="row">
                                    <div style="display: inline-block;">
                                        <svg width="30" height="20">
                                            <circle cx="20" cy="10" r="10"
                                                fill="peach" />
                                        </svg>
                                    </div>
                                    <div style="display: inline-block;">Peach(1550)</div>
                                </div>
                                <div class="row">
                                    <div style="display: inline-block;">
                                        <svg width="30" height="20">
                                            <circle cx="20" cy="10" r="10"
                                                fill="orange" />
                                        </svg>
                                    </div>
                                    <div style="display: inline-block;">Orange(10)</div>
                                </div>
                                <a href="#" class="color_red">Reset</a>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <div>
                        <div class="panel-heading">
                            <h4 class="panel-title">PRICES
                                <a data-toggle="collapse" class="float_right" data-parent="#accordion" href="#collapse3">
                                    <img class="col_in" /></a>
                            </h4>
                        </div>
                        <div id="collapse3" class="panel-collapse collapse in">
                            <div class="panel-body" style="border-top: none;">
                                <p class="text-center">31 Items</p>
                                <div id="slider-start"></div>
                                <p class="float_left">Rs.174</p>
                                <p class="float_right">Rs.8999</p>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <div>
                        <div class="panel-heading">
                            <h4 class="panel-title">PRICES
                                <a data-toggle="collapse" class="float_right" data-parent="#accordion" href="#collapse3">
                                    <img class="col_in" /></a>
                            </h4>
                        </div>
                        <div id="collapse4" class="panel-collapse collapse in">
                            <div class="panel-body" style="border-top: none;">
                                <asp:CheckBoxList ID="CheckBoxList1" runat="server">
                                    <asp:ListItem Value="" runat="server">XXS(81)</asp:ListItem>
                                    <asp:ListItem Value="" runat="server">XS(1446)</asp:ListItem>
                                    <asp:ListItem Value="" runat="server">S(24706)</asp:ListItem>
                                    <asp:ListItem Value="" runat="server">M(29467)</asp:ListItem>
                                    <asp:ListItem Value="" runat="server">L(29516)</asp:ListItem>
                                    <asp:ListItem Value="" runat="server">XL(27823)</asp:ListItem>
                                    <asp:ListItem Value="" runat="server">XXL(16841)</asp:ListItem>
                                    <asp:ListItem Value="" runat="server">XXXL(43)</asp:ListItem>
                                </asp:CheckBoxList>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <a href="#">
                <img src="images/promo2.jpg" alt="imgpromo2" class="image" /></a>
        </div>

        <div class="col-sm-9">
            <h1 class="heading">Men T-shirts</h1>
            <div class="row">
                <div class="col-sm-8 col-xs-0">
                </div>
                <div class="col-sm-1 col-xs-2">
                    <h5>SortBy</h5>
                </div>
                <div class="col-sm-3 col-xs-6">
                    <div class="form-group">

                        <asp:DropDownList class="form-control" ID="shortBy" runat="server" AutoPostBack="true" OnSelectedIndexChanged="shortBy_SelectedIndexChanged">
                            <asp:ListItem Value="Position">Position</asp:ListItem>
                            <asp:ListItem Value="NAME">Name</asp:ListItem>
                            <asp:ListItem Value="PRICE">Price</asp:ListItem>
                            <asp:ListItem Value="Relavence">Relavence</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4 col-xs-12">
                    <asp:DataList ID="dlProduct" runat="server" RepeatDirection="Horizontal" RepeatColumns="3" OnItemCommand="dlProduct_ItemCommand">
                        <ItemTemplate>
                            <div class="show-image">
                                <asp:HiddenField ID="hdnId" runat="server" Value='<%#Eval("ID") %>' />
                                <img class="image" src="<%# Eval("ImageUrl") %>" style="height: 350px; width: 280px" />
                                <asp:Button ID="btnCart" class="update" runat="server" Text="ADD TO CART" CommandName="cart" />
                            </div>
                            <asp:HyperLink ID="hlProduct" class="items caption" runat="server" href="ProductDetail.aspx" Text='<% #Eval("Name")%>' />
                            <br></br>
                        <asp:Label class="items caption" ID="lblPrice" runat="server" CssClass="color_red" Text='<% #Eval("Price")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div>
            <%--       <div class="show-image">
                        <img src="images/new-thumb-01.jpg" class="image" alt="" />
                        <input class="update" type="button" value="ADD TO CART" />
                    </div>
                    <p class="items caption">full sleeve plain tshirt for man</p>
                    <p class="prize">$120.00</p>
                </div>
                <div class="col-sm-4 col-xs-12">
                    <div class="show-image">
                        <img src="images/new-thumb-02.jpg" class="image" alt="" />
                        <input class="update" type="button" value="ADD TO CART" />
                    </div>
                    <p class="items caption">full sleeve plain tshirt for man</p>
                    <p class="prize">$120.00</p>
                </div>
                <div class="col-sm-4 col-xs-12">
                    <div class="show-image">
                        <img src="images/new-thumb-03.jpg" class="image" alt="" />
                        <input class="update" type="button" value="ADD TO CART" />
                    </div>
                    <p class="items caption">full sleeve plain tshirt for man</p>
                    <p class="prize">$120.00</p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4 col-xs-12">
                    <div class="show-image">
                        <img src="images/new-thumb-04.jpg" class="image" alt="" />
                        <input class="update" type="button" value="ADD TO CART" />
                    </div>
                    <p class="items caption">full sleeve plain tshirt for man</p>
                    <p class="prize">$120.00</p>
                </div>
                <div class="col-sm-4 col-xs-12">
                    <div class="show-image">
                        <img src="images/new-thumb-05.jpg" class="image" alt="" />
                        <input class="update" type="button" value="ADD TO CART" />
                    </div>
                    <p class="items caption">full sleeve plain tshirt for man</p>
                    <p class="prize">$120.00</p>
                </div>
                <div class="col-sm-4 col-xs-12">
                    <div class="show-image">
                        <img src="images/new-thumb-06.jpg" class="image" alt="" />
                        <input class="update" type="button" value="ADD TO CART" />
                    </div>
                    <p class="items caption">full sleeve plain tshirt for man</p>
                    <p class="prize">$120.00</p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4 col-xs-12">
                    <div class="show-image">
                        <img src="images/new-thumb-07.jpg" class="image" alt="" />
                        <input class="update" type="button" value="ADD TO CART" />
                    </div>
                    <p class="items caption">full sleeve plain tshirt for man</p>
                    <p class="prize">$120.00</p>
                </div>
                <div class="col-sm-4 col-xs-12">
                    <div class="show-image">
                        <img src="images/new-thumb-08.jpg" class="image" alt="" />
                        <input class="update" type="button" value="ADD TO CART" />
                    </div>
                    <p class="items caption">full sleeve plain tshirt for man</p>
                    <p class="prize">$120.00</p>
                </div>
                <div class="col-sm-4 col-xs-12">
                    <div class="show-image">
                        <img src="images/new-thumb-01.jpg" class="image" alt="" />
                        <input class="update" type="button" value="ADD TO CART" />
                    </div>
                    <p class="items caption">full sleeve plain tshirt for man</p>
                    <p class="prize">$120.00</p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4 col-xs-12">
                    <div class="show-image">
                        <img src="images/new-thumb-02.jpg" class="image" alt="" />
                        <input class="update" type="button" value="ADD TO CART" />
                    </div>
                    <p class="items caption">full sleeve plain tshirt for man</p>
                    <p class="prize">$120.00</p>
                </div>
                <div class="col-sm-4 col-xs-12">
                    <div class="show-image">
                        <img src="images/new-thumb-03.jpg" class="image" alt="" />
                        <input class="update" type="button" value="ADD TO CART" />
                    </div>
                    <p class="items caption">full sleeve plain tshirt for man</p>
                    <p class="prize">$120.00</p>
                </div>
                <div class="col-sm-4 col-xs-12">
                    <div class="show-image">
                        <img src="images/new-thumb-04.jpg" class="image" alt="" />
                        <input class="update" type="button" value="ADD TO CART" />
                    </div>
                    <p class="items caption">full sleeve plain tshirt for man</p>
                    <p class="prize">$120.00</p>
                </div>
            </div>--%>
            <div class="text-center">
                <asp:Button type="button" Text="More products" class="btn btn-primary" runat="server" />
            </div>
        </div>
    </section>

</asp:Content>
