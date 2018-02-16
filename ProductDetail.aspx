<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="Eshopper_Project.ProductDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>ProductDetail page</title>
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

        <div class="row">
            <div class="col-sm-5 col-xs-12">
                <img src="images/new-thumb-01-big.jpg" class="image" alt="" />
                <img src="images/img01.jpg" class="image" alt="" />
            </div>
            <div class="col-sm-7 col-xs-12">
                <p class="font_36">Polo assn. full sleeve plain tshirt for man</p>
                <p>Polo assn. full sleeve plain tshirt for man.Polo assn. full sleeve plain tshirt for man.Polo assn. full sleeve plain tshirt for man.Polo assn. full sleeve plain tshirt for manPolo assn. full sleeve plain tshirt for man.Polo assn. full sleeve plain tshirt for man</p>
                <p>sku:<b>mag209_prod1</b></p>
                <p>
                    Availability:
                        <button type="submit" class="btn-success">In stock</button>
                    <button type="submit" class="btn-danger" style="margin-left: 5px;">Not avilable</button>
                </p>
                <h1 class="color_red" id="prize">$120.00</h1>
                <div class="form-group">
                    <label for="Contry" class="float_left">Size*</label><label class="color_red float_right">*required field</label>
                    <asp:DropDownList class="form-control" ID="productSize" runat="server">
                        <asp:ListItem Value="">--select one--</asp:ListItem>
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem Value="2">2</asp:ListItem>
                        <asp:ListItem Value="3">3</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="row">
                    <div class="col-sm-1 col-xs-1">
                        <h5>Qty.</h5>
                    </div>
                    <div class="col-sm-2 col-xs-4">
                        <div class="form-group">
                            <asp:DropDownList class="form-control" ID="productQty" runat="server">
                                <asp:ListItem Value="1">1</asp:ListItem>
                                <asp:ListItem Value="2">2</asp:ListItem>
                                <asp:ListItem Value="3">3</asp:ListItem>
                                <asp:ListItem Value="4">4</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-sm-3 col-xs-6">
                        <asp:Button class="btn btn-primary required" ID="addcart" Text="ADD TO CART" runat="server" />
                    </div>
                </div>
                <asp:HyperLink class="color_red" runat="server">add to wishlist</asp:HyperLink>
                <ul class="nav nav-tabs" style="padding-top: 20px;">
                    <li class="active"><a data-toggle="tab" href="#Delivery" class="product model_border">Delivery</a></li>
                    <li><a data-toggle="tab" href="#Shipping" class="product model_border">Shipping</a></li>
                    <li><a data-toggle="tab" href="#Sizeguide" class="product model_border">Sizeguide</a></li>
                </ul>
                <div class="tab-content model_border">
                    <div id="Delivery" class="tab-pane fade in active">
                        <h3>delivery</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    </div>
                    <div id="Shipping" class="tab-pane fade">
                        <h3>Shipping</h3>
                        <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                    </div>
                    <div id="Sizeguide" class="tab-pane fade">
                        <h3>Sizeguide</h3>
                        <div class="table-responsive">
                            <table class="table" style="border: 1px solid #dddddd">
                                <thead style="background-color: #f5f5f5;">
                                    <tr>
                                        <th>Size</th>
                                        <th>S</th>
                                        <th>M</th>
                                        <th>L</th>
                                        <th>XL</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Men</td>
                                        <td>7-10</td>
                                        <td>10-13</td>
                                        <td>13-15</td>
                                        <td>15-17</td>
                                    </tr>
                                    <tr>
                                        <td>Women</td>
                                        <td>7-9</td>
                                        <td>10-12</td>
                                        <td>13-14</td>
                                        <td>15-16</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <ul class="nav nav-tabs" style="padding-top: 20px;">
            <li class="active"><a data-toggle="tab" href="#Productdescription" class="product">Product description</a></li>
            <li><a data-toggle="tab" href="#ProductREview" class="product">Product REview</a></li>
            <li><a data-toggle="tab" href="#CMStab" class="product">CMS tab</a></li>
        </ul>

        <div class="tab-content">
            <div id="Productdescription" class="tab-pane fade in active">
                <h3>Product description</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
            </div>
            <div id="ProductREview" class="tab-pane fade">
                <a href="#demo" class="color_red" data-toggle="collapse">Write a review</a>
                <div id="demo" class="collapse">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="form-group">
                                <img src="images/star.svg" class="svg_size">
                                <img src="images/star.svg" class="svg_size">
                                <img src="images/star.svg" class="svg_size">
                                <img src="images/star.svg" class="svg_size">
                                <img src="images/star.svg" class="svg_size">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="form-group">
                                <textarea class="form-control" id="exampleFormControlTextarea1" rows="5" placeholder="Write a review" style="resize: none;"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary">SIGN UP</button>
                            </div>
                        </div>
                    </div>
                </div>
                <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
            </div>
            <div id="CMStab" class="tab-pane fade">
                <h3>CMS tab</h3>
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                    sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                </p>
            </div>
        </div>

    </div>
</asp:Content>
