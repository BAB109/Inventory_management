-- ============================================================
-- Seed Data for Scrap Market Engine Database
-- Insert order respects FK constraints
-- ============================================================

-- 1. Metal types
INSERT INTO public.metal (metalname) VALUES
  ('Steel'),
  ('Copper'),
  ('Aluminium'),
  ('Iron'),
  ('Brass');

-- 2. Quality grades
INSERT INTO public.quality (qualityname) VALUES
  ('Grade A'),
  ('Grade B'),
  ('Grade C');

-- 3. Sellers (addressid will match selleraddress entries inserted next)
INSERT INTO public.seller (name, phone, addressid) VALUES
  ('Ramesh Scrap Works',   9876543210, 1),
  ('Kumar Metal Traders',  9823456781, 2),
  ('Sunita Enterprises',   9712345678, 3);

-- 4. Seller addresses (FK: sellerid -> seller)
INSERT INTO public.selleraddress (sellerid, addressline, city, state, pincode) VALUES
  (1, '12, Industrial Area, Phase 2', 'Pune',      'Maharashtra', 411019),
  (2, '45, MG Road, Opp Bus Stand',   'Nagpur',    'Maharashtra', 440001),
  (3, '7, Gandhi Nagar, Near Market', 'Aurangabad', 'Maharashtra', 431001);

-- 5. Buyers (addressid will match buyeraddress entries inserted next)
INSERT INTO public.buyer (name, phone, addressid) VALUES
  ('Patel Steel Pvt Ltd',   9911223344, 1),
  ('Mehta Recycling Co',    9900112233, 2),
  ('Joshi Metal Industries',9988776655, 3);

-- 6. Buyer addresses (FK: buyerid -> buyer)
INSERT INTO public.buyeraddress (buyerid, addressline, city, state, pincode) VALUES
  (1, 'Plot 5, MIDC Industrial Zone',     'Mumbai',    'Maharashtra', 400093),
  (2, '33, Nehru Nagar, Ring Road',       'Surat',     'Gujarat',     395001),
  (3, '88, Shivaji Marg, Sector 12',      'Delhi',     'Delhi',       110015);

-- 7. Inventory (stock of each metal/quality combo) (FK: metalid, qualityid)
INSERT INTO public.inventory (metalid, qualityid, weight) VALUES
  (1, 1, 5000),   -- Steel  Grade A : 5000 kg
  (1, 2, 3200),   -- Steel  Grade B : 3200 kg
  (2, 1, 1800),   -- Copper Grade A : 1800 kg
  (2, 2,  900),   -- Copper Grade B :  900 kg
  (3, 1, 2500),   -- Aluminium Grade A : 2500 kg
  (3, 3, 1100),   -- Aluminium Grade C : 1100 kg
  (4, 2, 4000),   -- Iron   Grade B : 4000 kg
  (5, 1,  600);   -- Brass  Grade A :  600 kg

-- 8. Scrap logs — incoming scrap from sellers (FK: sellerid, metalid, qualityid)
INSERT INTO public.scraplog (sellerid, metalid, weight, date_recived, qualityid) VALUES
  (1, 1, 1200, '2026-09-01', 1),  -- Ramesh: 1200 kg Steel Grade A
  (1, 4,  800, '2026-09-03', 2),  -- Ramesh: 800 kg Iron Grade B
  (2, 2,  500, '2026-09-05', 1),  -- Kumar:  500 kg Copper Grade A
  (2, 3,  700, '2026-09-07', 3),  -- Kumar:  700 kg Aluminium Grade C
  (3, 5,  300, '2026-09-10', 1),  -- Sunita: 300 kg Brass Grade A
  (3, 1,  950, '2026-09-12', 2),  -- Sunita: 950 kg Steel Grade B
  (1, 2,  420, '2026-09-15', 2),  -- Ramesh: 420 kg Copper Grade B
  (2, 4, 1500, '2026-09-18', 2);  -- Kumar:  1500 kg Iron Grade B

-- 9. Orders from buyers (FK: buyerid, metalid)
INSERT INTO public.orders (buyerid, metalid, requiredwt, shape, status, orderdate) VALUES
  (1, 1, 2000, 'Sheet',  'Completed', '2026-09-10'),
  (2, 2,  400, 'Wire',   'Completed', '2026-09-11'),
  (3, 3,  600, 'Bar',    'Processing','2026-09-14'),
  (1, 4, 1000, 'Plate',  'Completed', '2026-09-16'),
  (2, 5,  250, 'Rod',    'Pending',   '2026-09-20'),
  (3, 1,  800, 'Sheet',  'Processing','2026-09-22');

-- 10. Transactions — completed sales (FK: orderid, metalid)
INSERT INTO public.transactions (orderid, metalid, wtsold, priceperkg, totalamount, transactiondate) VALUES
  (1, 1, 2000, 45,  90000, '2026-09-12'),  -- Steel Sheet sale
  (2, 2,  400, 520, 208000,'2026-09-13'),  -- Copper Wire sale
  (4, 4, 1000, 30,  30000, '2026-09-17');  -- Iron Plate sale
