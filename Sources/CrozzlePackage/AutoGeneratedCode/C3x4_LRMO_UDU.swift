public class C3x4_LRMO_UDU {
   static func Execute(W: WordModelSOA, wordCount: Int) -> ClusterModel {
        let interlockWidth = 3
        let interlockHeight = 4
        let stride = interlockWidth + interlockHeight
        var index = 0 //pointer to where we should put next set of words
        var shapeCount = 0
        var outerStart: [UInt8] = []
        var wordId: [UInt8] = []

        for phase in 0..<2 {
            if phase == 1 {
                wordId = Array(repeating: 0, count: stride * shapeCount)
                outerStart = Array(repeating: 0, count: stride * shapeCount)
            }

            for up1 in 0..<wordCount {

                if (W.Len[up1] >= interlockHeight) {
                    //print("up1:\(W.Start[up1])")

                    for left1 in 0..<wordCount {

                        if (W.Len[left1] >= interlockWidth &&
                            W.End[left1][2] == W.End[up1][3] &&
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
                                            W.Start[right2][0] == W.End[up1][2] &&
                                            W.Start[right2][1] == W.Start[down2][1] &&
                                            W.Id[right2] != W.Id[down2] &&
                                            W.Id[right2] != W.Id[left1] &&
                                            W.Id[right2] != W.Id[up1]) {
                                            //print("right2:\(W.Start[right2])")

                                            for up3 in 0..<wordCount {

                                                if (W.Len[up3] >= interlockHeight &&
                                                    W.End[up3][3] == W.End[left1][0] &&
                                                    W.End[up3][2] == W.Start[right2][2] &&
                                                    W.Id[up3] != W.Id[right2] &&
                                                    W.Id[up3] != W.Id[down2] &&
                                                    W.Id[up3] != W.Id[left1] &&
                                                    W.Id[up3] != W.Id[up1]) {
                                                    //print("up3:\(W.Start[up3])")

                                                    for middlex3 in 0..<wordCount {

                                                        if (W.Len[middlex3] == interlockWidth &&
                                                            W.Start[middlex3][0] == W.End[up1][1] &&
                                                            W.Start[middlex3][1] == W.Start[down2][2] &&
                                                            W.Start[middlex3][2] == W.End[up3][1] &&
                                                            W.Id[middlex3] != W.Id[up3] &&
                                                            W.Id[middlex3] != W.Id[right2] &&
                                                            W.Id[middlex3] != W.Id[down2] &&
                                                            W.Id[middlex3] != W.Id[left1] &&
                                                            W.Id[middlex3] != W.Id[up1]) {
                                                            //print("middlex3:\(W.Start[middlex3])")

                                                            for outerx4 in 0..<wordCount {

                                                                if W.Len[outerx4] >= interlockWidth + 2 {

                                                                    let outerx4Limit = Int(W.Len[outerx4]) - Int(interlockWidth)
                                                                    for outerx4Pos in 1..<outerx4Limit {

                                                                        if (W.Start[outerx4][outerx4Pos + 0] == W.End[up1][0] &&
                                                                        W.Start[outerx4][outerx4Pos + 1] == W.Start[down2][3] &&
                                                                        W.Start[outerx4][outerx4Pos + 2] == W.End[up3][0] &&
                                                                        W.Id[outerx4] != W.Id[middlex3] &&
                                                                        W.Id[outerx4] != W.Id[up3] &&
                                                                        W.Id[outerx4] != W.Id[right2] &&
                                                                        W.Id[outerx4] != W.Id[down2] &&
                                                                        W.Id[outerx4] != W.Id[left1] &&
                                                                        W.Id[outerx4] != W.Id[up1]) {
                                                                            //print("outerx4:\(W.Start[outerx4])")

                                                                            if phase == 0 {
                                                                                shapeCount += 1
                                                                            }
                                                                            else {
                                                                                outerStart[index + 3] = UInt8(outerx4Pos)

                                                                                ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [left1, right2, middlex3, outerx4, up1, down2, up3])
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
            outerStart: outerStart,
            patternHorizontal: [.leading, .trailing, .middle, .outer],
            patternVertical: [.leading, .trailing, .leading],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount)
    }
}