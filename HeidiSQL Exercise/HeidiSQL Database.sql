-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table online coffee shop.ingredients
CREATE TABLE IF NOT EXISTS `ingredients` (
  `IngredientID` int NOT NULL,
  `Name` varchar(100) NOT NULL,
  `inStorageAmount` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`IngredientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table online coffee shop.ingredients: ~5 rows (approximately)
INSERT INTO `ingredients` (`IngredientID`, `Name`, `inStorageAmount`) VALUES
	(101, 'Chocolate', '2 liters'),
	(102, 'Caramel', '500 g'),
	(103, 'Coffee beans', '900 g'),
	(104, 'Milk', '1 liter'),
	(105, 'Sugar', '100 g');

-- Dumping structure for table online coffee shop.ordered_product
CREATE TABLE IF NOT EXISTS `ordered_product` (
  `OrderedProductID` int NOT NULL,
  `Quantity` int NOT NULL,
  `OrderID` int NOT NULL,
  `CoffeeID` int NOT NULL,
  PRIMARY KEY (`OrderedProductID`),
  KEY `OrderID` (`OrderID`),
  KEY `CoffeeID` (`CoffeeID`),
  CONSTRAINT `ordered_product_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  CONSTRAINT `ordered_product_ibfk_2` FOREIGN KEY (`CoffeeID`) REFERENCES `products` (`CoffeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table online coffee shop.ordered_product: ~5 rows (approximately)
INSERT INTO `ordered_product` (`OrderedProductID`, `Quantity`, `OrderID`, `CoffeeID`) VALUES
	(1, 2, 504, 25),
	(2, 3, 502, 27),
	(3, 1, 503, 25),
	(4, 5, 501, 26),
	(5, 2, 500, 27);

-- Dumping structure for table online coffee shop.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `OrderID` int NOT NULL,
  `PaymentMethod` varchar(100) NOT NULL,
  `TotalPrice` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `Status` varchar(100) NOT NULL,
  PRIMARY KEY (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table online coffee shop.orders: ~5 rows (approximately)
INSERT INTO `orders` (`OrderID`, `PaymentMethod`, `TotalPrice`, `Status`) VALUES
	(500, 'Cash', '20 RON', 'Paid'),
	(501, 'Card Payment', '230 RON', 'Not Paid'),
	(502, 'Card Payment', '125 RON', 'Processing Payment'),
	(503, 'Card Payment', '67 RON', 'Paid'),
	(504, 'Cash', '14 RON', 'Paid');

-- Dumping structure for table online coffee shop.products
CREATE TABLE IF NOT EXISTS `products` (
  `CoffeeID` int NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Price` varchar(100) NOT NULL,
  PRIMARY KEY (`CoffeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table online coffee shop.products: ~3 rows (approximately)
INSERT INTO `products` (`CoffeeID`, `Name`, `Price`) VALUES
	(25, 'Caramel Coffee', '30 RON'),
	(26, 'Chocolate Coffee', '45 RON'),
	(27, 'Espresso', '22 RON');

-- Dumping structure for table online coffee shop.product_ingredients
CREATE TABLE IF NOT EXISTS `product_ingredients` (
  `CoffeeID` int NOT NULL,
  `IngredientID` int NOT NULL,
  `Amount` varchar(50) NOT NULL DEFAULT '',
  KEY `CoffeeID` (`CoffeeID`),
  KEY `IngredientID` (`IngredientID`),
  CONSTRAINT `product_ingredients_ibfk_1` FOREIGN KEY (`CoffeeID`) REFERENCES `products` (`CoffeeID`),
  CONSTRAINT `product_ingredients_ibfk_2` FOREIGN KEY (`IngredientID`) REFERENCES `ingredients` (`IngredientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table online coffee shop.product_ingredients: ~10 rows (approximately)
INSERT INTO `product_ingredients` (`CoffeeID`, `IngredientID`, `Amount`) VALUES
	(25, 102, '10 g'),
	(25, 103, '10 g'),
	(25, 104, '100 ml'),
	(25, 105, '2 g'),
	(26, 101, '20 g'),
	(26, 103, '9 g'),
	(26, 104, '125 ml'),
	(26, 105, '3 g'),
	(27, 103, '15 g'),
	(27, 105, '1 g');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
