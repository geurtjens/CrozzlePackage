public class C3x6_LRLRMO_UDU {
   static func Execute(W: WordModelSOA, wordCount: Int) -> ClusterModel {
        let interlockWidth = 3
        let interlockHeight = 6
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

                                                    for left3 in 0..<wordCount {

                                                        if (W.Len[left3] >= interlockWidth &&
                                                            W.End[left3][2] == W.End[up1][3] &&
                                                            W.End[left3][1] == W.Start[down2][2] &&
                                                            W.End[left3][0] == W.End[up3][3] &&
                                                            W.Id[left3] != W.Id[up3] &&
                                                            W.Id[left3] != W.Id[right2] &&
                                                            W.Id[left3] != W.Id[down2] &&
                                                            W.Id[left3] != W.Id[left1] &&
                                                            W.Id[left3] != W.Id[up1]) {
                                                            //print("left3:\(W.Start[left3])")

                                                            for right4 in 0..<wordCount {

                                                                if (W.Len[right4] >= interlockWidth &&
                                                                    W.Start[right4][0] == W.End[up1][2] &&
                                                                    W.Start[right4][1] == W.Start[down2][3] &&
                                                                    W.Start[right4][2] == W.End[up3][2] &&
                                                                    W.Id[right4] != W.Id[left3] &&
                                                                    W.Id[right4] != W.Id[up3] &&
                                                                    W.Id[right4] != W.Id[right2] &&
                                                                    W.Id[right4] != W.Id[down2] &&
                                                                    W.Id[right4] != W.Id[left1] &&
                                                                    W.Id[right4] != W.Id[up1]) {
                                                                    //print("right4:\(W.Start[right4])")

                                                                    for middlex5 in 0..<wordCount {

                                                                        if (W.Len[middlex5] == interlockWidth &&
                                                                            W.Start[middlex5][0] == W.End[up1][1] &&
                                                                            W.Start[middlex5][1] == W.Start[down2][4] &&
                                                                            W.Start[middlex5][2] == W.End[up3][1] &&
                                                                            W.Id[middlex5] != W.Id[right4] &&
                                                                            W.Id[middlex5] != W.Id[left3] &&
                                                                            W.Id[middlex5] != W.Id[up3] &&
                                                                            W.Id[middlex5] != W.Id[right2] &&
                                                                            W.Id[middlex5] != W.Id[down2] &&
                                                                            W.Id[middlex5] != W.Id[left1] &&
                                                                            W.Id[middlex5] != W.Id[up1]) {
                                                                            //print("middlex5:\(W.Start[middlex5])")

                                                                            for outerx6 in 0..<wordCount {

                                                                                if W.Len[outerx6] >= interlockWidth + 2 {

                                                                                    let outerx6Limit = Int(W.Len[outerx6]) - Int(interlockWidth)
                                                                                    for outerx6Pos in 1..<outerx6Limit {

                                                                                        if (W.Start[outerx6][outerx6Pos + 0] == W.End[up1][0] &&
                                                                                        W.Start[outerx6][outerx6Pos + 1] == W.Start[down2][5] &&
                                                                                        W.Start[outerx6][outerx6Pos + 2] == W.End[up3][0] &&
                                                                                        W.Id[outerx6] != W.Id[middlex5] &&
                                                                                        W.Id[outerx6] != W.Id[right4] &&
                                                                                        W.Id[outerx6] != W.Id[left3] &&
                                                                                        W.Id[outerx6] != W.Id[up3] &&
                                                                                        W.Id[outerx6] != W.Id[right2] &&
                                                                                        W.Id[outerx6] != W.Id[down2] &&
                                                                                        W.Id[outerx6] != W.Id[left1] &&
                                                                                        W.Id[outerx6] != W.Id[up1]) {
                                                                                            //print("outerx6:\(W.Start[outerx6])")

                                                                                            if phase == 0 {
                                                                                                shapeCount += 1
                                                                                            }
                                                                                            else {
                                                                                                outerStart[index + 5] = UInt8(outerx6Pos)

                                                                                                ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [left1, right2, left3, right4, middlex5, outerx6, up1, down2, up3])
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
            }
        }

        return ClusterModel(
            wordId: wordId,
            outerStart: outerStart,
            patternHorizontal: [.leading, .trailing, .leading, .trailing, .middle, .outer],
            patternVertical: [.leading, .trailing, .leading],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount)
    }
}