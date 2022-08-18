create table [products] (
	product_id int identity,
	product_name varchar(250) ,
	product_number int ,
	safety_stock_level int,
	reorder_point int,
	standard_cost money,
	list_price money,
	product_size money,
	product_weight money,
	product_color_id int,
	ps_measure_id int,
	product_category_id int,
	product_model_id int,
	pw_measure_id int,
  constraint [PK_PRODUCTS] primary key  ( [product_id]) 

)

create table [product_color] (
	product_color_id int identity,
	product_color_name varchar(250),
  constraint [PK_PRODUCT_COLOR] primary key ([product_color_id] )
)

create table [product_measure] (
	product_measure_id int identity,
	product_measure_name varchar(250),
  constraint [PK_PRODUCT_MEASURE] primary key ([product_measure_id])
)

create table [product_category] (
	product_category_id int identity,
	product_category_name varchar(250),
	product_sub_category_id int,
  constraint [PK_PRODUCT_CATEGORY] primary key ([product_category_id]) 

)

create table [product_model] (
	product_model_id int identity,
	product_model_name varchar(250),
  constraint [PK_PRODUCT_MODEL] primary key([product_model_id]) 
)


create table [product_line] (
	product_line_id int identity,
	product_line_name varchar(250),
  constraint [PK_PRODUCT_LINE] primary key ([product_line_id])

)


create table [product_sub_category] (
	product_sub_category_id int identity,
	product_sub_category_name int,
  constraint [PK_PRODUCT_SUB_CATEGORY] primary key ( [product_sub_category_id]) 

)

create table [product_line_category] (
	product_line_id int identity,
	product_category_id int
)

create table [sales_order_details] (
	sales_order_details int identity,
	sales_order_id int,
	sales_order_qty int,
	product_id int,
	sales_unit_price money,
	sales_unit_price_discount money,
	line_total money,
  constraint [PK_SALES_ORDER_DETAILS] primary key CLUSTERED([sales_order_details])

)


create table [sales_order_header] (
	sales_order_id int identity,
	order_date datetime,
	due_date datetime,
	ship_date datetime,
	sales_order_number int,
	online_order_flag_id int,
	purchase_order_number int,
	account_number int,
	sub_total money,
	tax_amount money,
	freight money,
	total_due money,
	online_order_flag money,
	sales_person_id int,
	customer_id int,
  constraint [PK_SALES_ORDER_HEADER] primary key ([sales_order_id]) 

)

create table [customer] (
	customer_id int identity,
	customer_title varchar(250),
	customer_first_name varchar(250),
	customer_middle_name varchar(250),
	customer_last_name varchar(250),
	customer_suffix varchar(250),
  constraint [PK_CUSTOMER] primary key ([customer_id])

)

create table [sales_person] (
	sales_person_id int identity,
	sales_quota int,
	sales_bonus int,
	sales_commission money,
  constraint [PK_SALES_PERSON] primary key([sales_person_id]) 

)

alter table [products]  add constraint [products_fk0] foreign key ([product_color_id]) references [product_color]([product_color_id])


alter table [products]  add constraint [products_fk1] foreign key ([ps_measure_id]) references [product_measure]([product_measure_id])


alter table [products] add constraint [products_fk2] foreign key ([product_category_id]) references [product_category]([product_category_id])


alter table [products] add constraint [products_fk3] foreign key ([product_model_id]) references [product_model]([product_model_id])

alter table [products]  add constraint [products_fk4] foreign key ([pw_measure_id]) references [product_measure]([product_measure_id])


alter table [product_category] add constraint [product_category_fk0] foreign key ([product_sub_category_id]) references [product_sub_category]([product_sub_category_id])


alter table [product_line_category] add constraint [product_line_category_fk0] foreign key ([product_line_id]) references [product_line]([product_line_id])


alter table [product_line_category] add constraint [product_line_category_fk1] foreign key ([product_category_id]) references [product_category]([product_category_id])


alter table [sales_order_details] add constraint [sales_order_details_fk0] foreign key ([sales_order_id]) references [sales_order_header]([sales_order_id])

alter table [sales_order_details] add constraint [sales_order_details_fk1] foreign key ([product_id]) references [products]([product_id])



alter table [sales_order_header] add constraint [sales_order_header_fk1] foreign key ([sales_person_id]) references [sales_person]([sales_person_id])

alter table [sales_order_header] add constraint [sales_order_header_fk2] foreign key ([customer_id]) references [customer]([customer_id])



