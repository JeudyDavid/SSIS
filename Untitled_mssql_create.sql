CREATE TABLE [products] (
	product_id integer NOT NULL,
	product_name string NOT NULL,
	product_number integer NOT NULL,
	safety_stock_level integer NOT NULL,
	reorder_point integer NOT NULL,
	standard_cost float NOT NULL,
	list_price float NOT NULL,
	product_size float NOT NULL,
	product_weight float NOT NULL,
	product_color_id integer NOT NULL,
	ps_measure_id integer NOT NULL,
	product_category_id integer NOT NULL,
	product_model_id integer NOT NULL,
	pw_measure_id integer NOT NULL,
  CONSTRAINT [PK_PRODUCTS] PRIMARY KEY  ( [product_id]) 

)

CREATE TABLE [product_color] (
	product_color_id integer NOT NULL,
	product_color_name string NOT NULL,
  CONSTRAINT [PK_PRODUCT_COLOR] PRIMARY KEY ([product_color_id] )
)

CREATE TABLE [product_measure] (
	product_measure_id integer NOT NULL,
	product_measure_name string NOT NULL,
  CONSTRAINT [PK_PRODUCT_MEASURE] PRIMARY KEY ([product_measure_id])
)

CREATE TABLE [product_category] (
	product_category_id integer NOT NULL,
	product_category_name string NOT NULL,
	product_sub_category_id string NOT NULL,
  CONSTRAINT [PK_PRODUCT_CATEGORY] PRIMARY KEY ([product_category_id]) 

)

CREATE TABLE [product_model] (
	product_model_id integer NOT NULL,
	product_model_name string NOT NULL,
  CONSTRAINT [PK_PRODUCT_MODEL] PRIMARY KEY([product_model_id]) 
)


CREATE TABLE [product_line] (
	product_line_id binary NOT NULL,
	product_line_name string NOT NULL,
  CONSTRAINT [PK_PRODUCT_LINE] PRIMARY KEY CLUSTERED([product_line_id])

)


CREATE TABLE [product_sub_category] (
	product_sub_category_id integer NOT NULL,
	product_sub_category_name integer NOT NULL,
  CONSTRAINT [PK_PRODUCT_SUB_CATEGORY] PRIMARY KEY ( [product_sub_category_id]) 

)

CREATE TABLE [product_line_category] (
	product_line_id integer NOT NULL,
	product_category_id integer NOT NULL
)

CREATE TABLE [sales_order_details] (
	sales_order_details integer NOT NULL,
	sales_order_id integer NOT NULL,
	sales_order_qty integer NOT NULL,
	product_id integer NOT NULL,
	sales_unit_price float NOT NULL,
	sales_unit_price_discount float NOT NULL,
	line_total float NOT NULL,
  CONSTRAINT [PK_SALES_ORDER_DETAILS] PRIMARY KEY CLUSTERED([sales_order_details])

)


CREATE TABLE [sales_order_header] (
	sales_order_id integer NOT NULL,
	order_date datetime NOT NULL,
	due_date datetime NOT NULL,
	ship_date datetime NOT NULL,
	sales_order_number integer NOT NULL,
	online_order_flag_id integer NOT NULL,
	purchase_order_number integer NOT NULL,
	account_number integer NOT NULL,
	sub_total float NOT NULL,
	tax_amount float NOT NULL,
	freight float NOT NULL,
	total_due float NOT NULL,
	online_order_flag float NOT NULL,
	sales_person_id float NOT NULL,
	customer_id float NOT NULL,
  CONSTRAINT [PK_SALES_ORDER_HEADER] PRIMARY KEY ([sales_order_id]) 

)

CREATE TABLE [customer] (
	customer_id integer NOT NULL,
	customer_title string NOT NULL,
	customer_first_name string NOT NULL,
	customer_middle_name string NOT NULL,
	customer_last_name string NOT NULL,
	customer_suffix string NOT NULL,
  CONSTRAINT [PK_CUSTOMER] PRIMARY KEY ([customer_id])

)

CREATE TABLE [sales_person] (
	sales_person_id integer NOT NULL,
	sales_quota integer NOT NULL,
	sales_bonus integer NOT NULL,
	sales_commission float NOT NULL,
  CONSTRAINT [PK_SALES_PERSON] PRIMARY KEY([sales_person_id]) 

)

ALTER TABLE [products]  ADD CONSTRAINT [products_fk0] FOREIGN KEY ([product_color_id]) REFERENCES [product_color]([product_color_id])


ALTER TABLE [products]  ADD CONSTRAINT [products_fk1] FOREIGN KEY ([ps_measure_id]) REFERENCES [product_measure]([product_measure_id])


ALTER TABLE [products] ADD CONSTRAINT [products_fk2] FOREIGN KEY ([product_category_id]) REFERENCES [product_category]([product_category_id])


ALTER TABLE [products] ADD CONSTRAINT [products_fk3] FOREIGN KEY ([product_model_id]) REFERENCES [product_model]([product_model_id])

ALTER TABLE [products]  ADD CONSTRAINT [products_fk4] FOREIGN KEY ([pw_measure_id]) REFERENCES [product_measure]([product_measure_id])


ALTER TABLE [product_category] ADD CONSTRAINT [product_category_fk0] FOREIGN KEY ([product_sub_category_id]) REFERENCES [product_sub_category]([product_sub_category_id])


ALTER TABLE [product_line_category] ADD CONSTRAINT [product_line_category_fk0] FOREIGN KEY ([product_line_id]) REFERENCES [product_line]([product_line_id])


ALTER TABLE [product_line_category] ADD CONSTRAINT [product_line_category_fk1] FOREIGN KEY ([product_category_id]) REFERENCES [product_category]([product_category_id])


ALTER TABLE [sales_order_details] ADD CONSTRAINT [sales_order_details_fk0] FOREIGN KEY ([sales_order_id]) REFERENCES [sales_order_header]([sales_order_id])

ALTER TABLE [sales_order_details] ADD CONSTRAINT [sales_order_details_fk1] FOREIGN KEY ([product_id]) REFERENCES [products]([product_id])


ALTER TABLE [sales_order_header] ADD CONSTRAINT [sales_order_header_fk0] FOREIGN KEY ([online_order_flag_id]) REFERENCES [online_order_flag]([online_order_flag_id])

ALTER TABLE [sales_order_header] ADD CONSTRAINT [sales_order_header_fk1] FOREIGN KEY ([sales_person_id]) REFERENCES [sales_person]([sales_person_id])

ALTER TABLE [sales_order_header] ADD CONSTRAINT [sales_order_header_fk2] FOREIGN KEY ([customer_id]) REFERENCES [customer]([customer_id])




