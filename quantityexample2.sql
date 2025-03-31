use Northwind

select * from Products
select * from Customers
select * from Orders
select * from [Order Details]

-- Berlinde yasayan musteriler sut urunlerinden kacar adet almistir
go

select
SUM(OD.Quantity) as 'Satin Alinan Adet',
O.CustomerID, -- Musteriler
P.ProductName -- urun adi

from Orders O
inner join Customers C on O.CustomerID = C.CustomerID
inner join [Order Details] OD on O.OrderID = OD.OrderID
inner join Products P on OD.ProductID = P.ProductID

where P.CategoryID = 4 -- sut urunlerinin kategori no su 4
and C.City = 'Berlin' -- Berlinde yasayan musteriler

Group By
O.CustomerID, -- Musteriler ile urunleri grupladik.
P.ProductName

