--
-- PostgreSQL database dump
--

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: buyer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.buyer (
    buyerid integer NOT NULL,
    name character varying(50) NOT NULL,
    phone bigint NOT NULL,
    addressid integer NOT NULL
);


ALTER TABLE public.buyer OWNER TO postgres;

--
-- Name: buyer_buyerid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.buyer_buyerid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.buyer_buyerid_seq OWNER TO postgres;

--
-- Name: buyer_buyerid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.buyer_buyerid_seq OWNED BY public.buyer.buyerid;


--
-- Name: buyeraddress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.buyeraddress (
    addressid integer NOT NULL,
    buyerid integer NOT NULL,
    addressline character varying(500) NOT NULL,
    city character varying(100) NOT NULL,
    state character varying(100) NOT NULL,
    pincode bigint NOT NULL
);


ALTER TABLE public.buyeraddress OWNER TO postgres;

--
-- Name: buyeraddress_addressid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.buyeraddress_addressid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.buyeraddress_addressid_seq OWNER TO postgres;

--
-- Name: buyeraddress_addressid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.buyeraddress_addressid_seq OWNED BY public.buyeraddress.addressid;


--
-- Name: inventory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventory (
    metalid integer NOT NULL,
    qualityid integer NOT NULL,
    weight integer NOT NULL
);


ALTER TABLE public.inventory OWNER TO postgres;

--
-- Name: metal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metal (
    metalid integer NOT NULL,
    metalname character varying(50) NOT NULL
);


ALTER TABLE public.metal OWNER TO postgres;

--
-- Name: metal_metalid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metal_metalid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.metal_metalid_seq OWNER TO postgres;

--
-- Name: metal_metalid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metal_metalid_seq OWNED BY public.metal.metalid;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    orderid integer NOT NULL,
    buyerid integer NOT NULL,
    metalid integer NOT NULL,
    requiredwt integer,
    shape text,
    status character varying(100),
    orderdate date NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_orderid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_orderid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_orderid_seq OWNER TO postgres;

--
-- Name: orders_orderid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_orderid_seq OWNED BY public.orders.orderid;


--
-- Name: quality; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quality (
    qualityid integer NOT NULL,
    qualityname character varying(50) NOT NULL
);


ALTER TABLE public.quality OWNER TO postgres;

--
-- Name: quality_qualityid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.quality_qualityid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.quality_qualityid_seq OWNER TO postgres;

--
-- Name: quality_qualityid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.quality_qualityid_seq OWNED BY public.quality.qualityid;


--
-- Name: scraplog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scraplog (
    logid integer NOT NULL,
    sellerid integer NOT NULL,
    metalid integer NOT NULL,
    weight integer NOT NULL,
    date_recived date NOT NULL,
    qualityid integer NOT NULL
);


ALTER TABLE public.scraplog OWNER TO postgres;

--
-- Name: scraplog_logid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.scraplog_logid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.scraplog_logid_seq OWNER TO postgres;

--
-- Name: scraplog_logid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.scraplog_logid_seq OWNED BY public.scraplog.logid;


--
-- Name: seller; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seller (
    sellerid integer NOT NULL,
    name character varying(50) NOT NULL,
    phone bigint NOT NULL,
    addressid integer NOT NULL
);


ALTER TABLE public.seller OWNER TO postgres;

--
-- Name: seller_sellerid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seller_sellerid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seller_sellerid_seq OWNER TO postgres;

--
-- Name: seller_sellerid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.seller_sellerid_seq OWNED BY public.seller.sellerid;

--
-- Name: selleraddress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.selleraddress (
    addressid integer NOT NULL,
    sellerid integer NOT NULL,
    addressline character varying(500) NOT NULL,
    city character varying(100) NOT NULL,
    state character varying(100) NOT NULL,
    pincode bigint NOT NULL
);


ALTER TABLE public.selleraddress OWNER TO postgres;

--
-- Name: selleraddress_addressid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.selleraddress_addressid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.selleraddress_addressid_seq OWNER TO postgres;

--
-- Name: selleraddress_addressid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.selleraddress_addressid_seq OWNED BY public.selleraddress.addressid;


--
-- Name: transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transactions (
    transactionid bigint NOT NULL,
    orderid integer NOT NULL,
    metalid integer NOT NULL,
    wtsold integer,
    priceperkg integer,
    totalamount integer,
    transactiondate date NOT NULL
);


ALTER TABLE public.transactions OWNER TO postgres;

--
-- Name: transactions_transactionid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transactions_transactionid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transactions_transactionid_seq OWNER TO postgres;

--
-- Name: transactions_transactionid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transactions_transactionid_seq OWNED BY public.transactions.transactionid;


--
-- Name: buyer buyerid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buyer ALTER COLUMN buyerid SET DEFAULT nextval('public.buyer_buyerid_seq'::regclass);


--
-- Name: buyeraddress addressid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buyeraddress ALTER COLUMN addressid SET DEFAULT nextval('public.buyeraddress_addressid_seq'::regclass);


--
-- Name: metal metalid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metal ALTER COLUMN metalid SET DEFAULT nextval('public.metal_metalid_seq'::regclass);


--
-- Name: orders orderid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN orderid SET DEFAULT nextval('public.orders_orderid_seq'::regclass);


--
-- Name: quality qualityid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quality ALTER COLUMN qualityid SET DEFAULT nextval('public.quality_qualityid_seq'::regclass);


--
-- Name: scraplog logid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scraplog ALTER COLUMN logid SET DEFAULT nextval('public.scraplog_logid_seq'::regclass);


--
-- Name: seller sellerid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seller ALTER COLUMN sellerid SET DEFAULT nextval('public.seller_sellerid_seq'::regclass);


--
-- Name: selleraddress addressid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.selleraddress ALTER COLUMN addressid SET DEFAULT nextval('public.selleraddress_addressid_seq'::regclass);


--
-- Name: transactions transactionid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions ALTER COLUMN transactionid SET DEFAULT nextval('public.transactions_transactionid_seq'::regclass);


--
-- Name: buyer buyer_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buyer
    ADD CONSTRAINT buyer_phone_key UNIQUE (phone);


--
-- Name: buyer buyer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buyer
    ADD CONSTRAINT buyer_pkey PRIMARY KEY (buyerid);


--
-- Name: buyeraddress buyeraddress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buyeraddress
    ADD CONSTRAINT buyeraddress_pkey PRIMARY KEY (addressid);


--
-- Name: inventory inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (metalid, qualityid);


--
-- Name: metal metal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metal
    ADD CONSTRAINT metal_pkey PRIMARY KEY (metalid);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (orderid);


--
-- Name: quality quality_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quality
    ADD CONSTRAINT quality_pkey PRIMARY KEY (qualityid);


--
-- Name: scraplog scraplog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scraplog
    ADD CONSTRAINT scraplog_pkey PRIMARY KEY (logid);


--
-- Name: seller seller_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seller
    ADD CONSTRAINT seller_pkey PRIMARY KEY (sellerid);


--
-- Name: selleraddress selleraddress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.selleraddress
    ADD CONSTRAINT selleraddress_pkey PRIMARY KEY (addressid);


--
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (transactionid);


--
-- Name: buyeraddress buyeraddress_buyerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buyeraddress
    ADD CONSTRAINT buyeraddress_buyerid_fkey FOREIGN KEY (buyerid) REFERENCES public.buyer(buyerid) ON DELETE RESTRICT;


--
-- Name: inventory inventory_metalid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_metalid_fkey FOREIGN KEY (metalid) REFERENCES public.metal(metalid) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: inventory inventory_qualityid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventory
    ADD CONSTRAINT inventory_qualityid_fkey FOREIGN KEY (qualityid) REFERENCES public.quality(qualityid) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: orders orders_buyerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_buyerid_fkey FOREIGN KEY (buyerid) REFERENCES public.buyer(buyerid) ON DELETE RESTRICT;


--
-- Name: orders orders_metalid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_metalid_fkey FOREIGN KEY (metalid) REFERENCES public.metal(metalid) ON DELETE RESTRICT;


--
-- Name: scraplog scraplog_metalid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scraplog
    ADD CONSTRAINT scraplog_metalid_fkey FOREIGN KEY (metalid) REFERENCES public.metal(metalid) ON DELETE RESTRICT;


--
-- Name: scraplog scraplog_qualityid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scraplog
    ADD CONSTRAINT scraplog_qualityid_fkey FOREIGN KEY (qualityid) REFERENCES public.quality(qualityid) ON DELETE RESTRICT;


--
-- Name: scraplog scraplog_sellerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scraplog
    ADD CONSTRAINT scraplog_sellerid_fkey FOREIGN KEY (sellerid) REFERENCES public.seller(sellerid) ON DELETE RESTRICT;


--
-- Name: selleraddress selleraddress_sellerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.selleraddress
    ADD CONSTRAINT selleraddress_sellerid_fkey FOREIGN KEY (sellerid) REFERENCES public.seller(sellerid) ON DELETE RESTRICT;


--
-- Name: transactions transactions_metalid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_metalid_fkey FOREIGN KEY (metalid) REFERENCES public.metal(metalid) ON DELETE RESTRICT;


--
-- Name: transactions transactions_orderid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_orderid_fkey FOREIGN KEY (orderid) REFERENCES public.orders(orderid) ON DELETE RESTRICT;


-- PostgreSQL database dump complete
--

