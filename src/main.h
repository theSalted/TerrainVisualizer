#pragma once

void initPointMode(int height, int width, std::__1::unique_ptr<ImageIO> &heightmapImage);
void initLineMode(int height, int width, std::__1::unique_ptr<ImageIO> &heightmapImage);
void initTriangleMode(int height, int width, std::unique_ptr<ImageIO> &heightmapImage);