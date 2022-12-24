public class C3x6_LRMLMR_UDU {
   static func Execute(W: WordModelSOA, wordCount: Int) -> ClusterModel {
        let interlockWidth = 3
        let interlockHeight = 6
        let stride = interlockWidth + interlockHeight
        var index = 0 //pointer to where we should put next set of words
        var shapeCount = 0
        var wordId: [UInt8] = []

        for phase in 0..<2 {
            if phase == 1 {
                wordId = Array(repeating: 0, count: stride * shapeCount)
            }

            for up1 in 0..<wordCount {

                if (W.Len[up1] >= interlockHeight) {
                    //print("up1:\(W.Start[up1])")

                    for left1 in 0..<wordCount {

                        if (W.Len[left1] >= interlockWidth &&
                            W.End[left1][2] == W.End[up1][5] &&
                            W.Id[left1] != W.Id[up1]) {
                            //print("left1:\(W.Start[left1])")

                            for down2 in 0..<wordCount {

                                if (W.Len[down2] >= interlockHeight &&
                                    W.Start[down2][0] == W.End[left1][1] &&
                                    W.Id[down2] != W.Id[left1] &&
                                    W.Id[down2] != W.Id[up1]) {
                                    //print("down2:\(W.Start[down2])")

                                    for right2 in 0..<wordCount {

                                        if (W.Len[right2] >= interlockWidth &&
                                            W.Start[right2][0] == W.End[up1][4] &&
                                            W.Start[right2][1] == W.Start[down2][1] &&
                                            W.Id[right2] != W.Id[down2] &&
                                            W.Id[right2] != W.Id[left1] &&
                                            W.Id[right2] != W.Id[up1]) {
                                            //print("right2:\(W.Start[right2])")

                                            for up3 in 0..<wordCount {

                                                if (W.Len[up3] >= interlockHeight &&
                                                    W.End[up3][5] == W.End[left1][0] &&
                                                    W.End[up3][4] == W.Start[right2][2] &&
                                                    W.Id[up3] != W.Id[right2] &&
                                                    W.Id[up3] != W.Id[down2] &&
                                                    W.Id[up3] != W.Id[left1] &&
                                                    W.Id[up3] != W.Id[up1]) {
                                                    //print("up3:\(W.Start[up3])")

                                                    for middlex3 in 0..<wordCount {

                                                        if (W.Len[middlex3] == interlockWidth &&
                                                            W.Start[middlex3][0] == W.End[up1][3] &&
                                                            W.Start[middlex3][1] == W.Start[down2][2] &&
                                                            W.Start[middlex3][2] == W.End[up3][3] &&
                                                            W.Id[middlex3] != W.Id[up3] &&
                                                            W.Id[middlex3] != W.Id[right2] &&
                                                            W.Id[middlex3] != W.Id[down2] &&
                                                            W.Id[middlex3] != W.Id[left1] &&
                                                            W.Id[middlex3] != W.Id[up1]) {
                                                            //print("middlex3:\(W.Start[middlex3])")

                                                            for left4 in 0..<wordCount {

                                                                if (W.Len[left4] >= interlockWidth &&
                                                                    W.End[left4][2] == W.End[up1][2] &&
                                                                    W.End[left4][1] == W.Start[down2][3] &&
                                                                    W.End[left4][0] == W.End[up3][2] &&
                                                                    W.Id[left4] != W.Id[middlex3] &&
                                                                    W.Id[left4] != W.Id[up3] &&
                                                                    W.Id[left4] != W.Id[right2] &&
                                                                    W.Id[left4] != W.Id[down2] &&
                                                                    W.Id[left4] != W.Id[left1] &&
                                                                    W.Id[left4] != W.Id[up1]) {
                                                                    //print("left4:\(W.Start[left4])")

                                                                    for middlex5 in 0..<wordCount {

                                                                        if (W.Len[middlex5] == interlockWidth &&
                                                                            W.Start[middlex5][0] == W.End[up1][1] &&
                                                                            W.Start[middlex5][1] == W.Start[down2][4] &&
                                                                            W.Start[middlex5][2] == W.End[up3][1] &&
                                                                            W.Id[middlex5] != W.Id[left4] &&
                                                                            W.Id[middlex5] != W.Id[middlex3] &&
                                                                            W.Id[middlex5] != W.Id[up3] &&
                                                                            W.Id[middlex5] != W.Id[right2] &&
                                                                            W.Id[middlex5] != W.Id[down2] &&
                                                                            W.Id[middlex5] != W.Id[left1] &&
                                                                            W.Id[middlex5] != W.Id[up1]) {
                                                                            //print("middlex5:\(W.Start[middlex5])")

                                                                            for right6 in 0..<wordCount {

                                                                                if (W.Len[right6] >= interlockWidth &&
                                                                                    W.Start[right6][0] == W.End[up1][0] &&
                                                                                    W.Start[right6][1] == W.Start[down2][5] &&
                                                                                    W.Start[right6][2] == W.End[up3][0] &&
                                                                                    W.Id[right6] != W.Id[middlex5] &&
                                                                                    W.Id[right6] != W.Id[left4] &&
                                                                                    W.Id[right6] != W.Id[middlex3] &&
                                                                                    W.Id[right6] != W.Id[up3] &&
                                                                                    W.Id[right6] != W.Id[right2] &&
                                                                                    W.Id[right6] != W.Id[down2] &&
                                                                                    W.Id[right6] != W.Id[left1] &&
                                                                                    W.Id[right6] != W.Id[up1]) {
                                                                                    //print("right6:\(W.Start[right6])")

                                                                                    if phase == 0 {
                                                                                        shapeCount += 1
                                                                                    }
                                                                                    else {
                                                                                        ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [left1, right2, middlex3, left4, middlex5, right6, up1, down2, up3])
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        return ClusterModel(
            wordId: wordId,
            outerStart: [],
            patternHorizontal: [.leading, .trailing, .middle, .leading, .middle, .trailing],
            patternVertical: [.leading, .trailing, .leading],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount)
    }
}