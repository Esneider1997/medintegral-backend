CREATE TABLE `cliente`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apellido` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telefono` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `correo` varchar(85) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `cuenta`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `moneda` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fondo` decimal(8, 2) NOT NULL,
  `cliente_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_cuenta_cliente_idx`(`cliente_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `files`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `file_name` varchar(120) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `file_path` varchar(220) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

CREATE TABLE `rol`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `tipo_transaccion`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(65) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `descripcion_UNIQUE`(`descripcion`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `transaccion`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `cuenta_id` int NOT NULL,
  `tipo_transaccion_id` int NOT NULL,
  `monto` decimal(8, 2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_transaccion_cuenta1_idx`(`cuenta_id`) USING BTREE,
  INDEX `fk_transaccion_tipo_transaccion1_idx`(`tipo_transaccion_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

CREATE TABLE `usuario`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nombre_img` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ruta_img` varchar(220) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `rol_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_usuario_rol_idx`(`rol_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

ALTER TABLE `cuenta` ADD CONSTRAINT `fk_cuenta_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `transaccion` ADD CONSTRAINT `fk_transaccion_cuenta` FOREIGN KEY (`cuenta_id`) REFERENCES `cuenta` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE `transaccion` ADD CONSTRAINT `fk_transaccion_tipo_transaccion` FOREIGN KEY (`tipo_transaccion_id`) REFERENCES `tipo_transaccion` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE `usuario` ADD CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

