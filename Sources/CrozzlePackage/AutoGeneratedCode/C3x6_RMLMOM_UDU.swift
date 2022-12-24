public class C3x6_RMLMOM_UDU {
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

                    for right1 in 0..<wordCount {

                        if (W.Len[right1] >= interlockWidth &&
                            W.Start[right1][0] == W.End[up1][5] &&
                            W.Id[right1] != W.Id[up1]) {
                            //print("right1:\(W.Start[right1])")

                            for down2 in 0..<wordCount {

                                if (W.Len[down2] >= interlockHeight &&
                                    W.Start[down2][0] == W.Start[right1][1] &&
                                    W.Id[down2] != W.Id[right1] &&
                                    W.Id[down2] != W.Id[up1]) {
                                    //print("down2:\(W.Start[down2])")

                                    for middlex2 in 0..<wordCount {

                                        if (W.Len[middlex2] == interlockWidth &&
                                            W.Start[middlex2][0] == W.End[up1][4] &&
                                            W.Start[middlex2][1] == W.Start[down2][1] &&
                                            W.Id[middlex2] != W.Id[down2] &&
                                            W.Id[middlex2] != W.Id[right1] &&
                                            W.Id[middlex2] != W.Id[up1]) {
                                            //print("middlex2:\(W.Start[middlex2])")

                                            for up3 in 0..<wordCount {

                                                if (W.Len[up3] >= interlockHeight &&
                                                    W.End[up3][5] == W.Start[right1][2] &&
                                                    W.End[up3][4] == W.Start[middlex2][2] &&
                                                    W.Id[up3] != W.Id[middlex2] &&
                                                    W.Id[up3] != W.Id[down2] &&
                                                    W.Id[up3] != W.Id[right1] &&
                                                    W.Id[up3] != W.Id[up1]) {
                                                    //print("up3:\(W.Start[up3])")

                                                    for left3 in 0..<wordCount {

                                                        if (W.Len[left3] >= interlockWidth &&
                                                            W.End[left3][2] == W.End[up1][3] &&
                                                            W.End[left3][1] == W.Start[down2][2] &&
                                                            W.End[left3][0] == W.End[up3][3] &&
                                                            W.Id[left3] != W.Id[up3] &&
                                                            W.Id[left3] != W.Id[middlex2] &&
                                                            W.Id[left3] != W.Id[down2] &&
                                                            W.Id[left3] != W.Id[right1] &&
                                                            W.Id[left3] != W.Id[up1]) {
                                                            //print("left3:\(W.Start[left3])")

                                                            for middlex4 in 0..<wordCount {

                                                                if (W.Len[middlex4] == interlockWidth &&
                                                                    W.Start[middlex4][0] == W.End[up1][2] &&
                                                                    W.Start[middlex4][1] == W.Start[down2][3] &&
                                                                    W.Start[middlex4][2] == W.End[up3][2] &&
                                                                    W.Id[middlex4] != W.Id[left3] &&
                                                                    W.Id[middlex4] != W.Id[up3] &&
                                                                    W.Id[middlex4] != W.Id[middlex2] &&
                                                                    W.Id[middlex4] != W.Id[down2] &&
                                                                    W.Id[middlex4] != W.Id[right1] &&
                                                                    W.Id[middlex4] != W.Id[up1]) {
                                                                    //print("middlex4:\(W.Start[middlex4])")

                                                                    for outerx5 in 0..<wordCount {

                                                                        if W.Len[outerx5] >= interlockWidth + 2 {

                                                                            let outerx5Limit = Int(W.Len[outerx5]) - Int(interlockWidth)
                                                                            for outerx5Pos in 1..<outerx5Limit {

                                                                                if (W.Start[outerx5][outerx5Pos + 0] == W.End[up1][1] &&
                                                                                W.Start[outerx5][outerx5Pos + 1] == W.Start[down2][4] &&
                                                                                W.Start[outerx5][outerx5Pos + 2] == W.End[up3][1] &&
                                                                                W.Id[outerx5] != W.Id[middlex4] &&
                                                                                W.Id[outerx5] != W.Id[left3] &&
                                                                                W.Id[outerx5] != W.Id[up3] &&
                                                                                W.Id[outerx5] != W.Id[middlex2] &&
                                                                                W.Id[outerx5] != W.Id[down2] &&
                                                                                W.Id[outerx5] != W.Id[right1] &&
                                                                                W.Id[outerx5] != W.Id[up1]) {
                                                                                    //print("outerx5:\(W.Start[outerx5])")

                                                                                    for middlex6 in 0..<wordCount {

                                                                                        if (W.Len[middlex6] == interlockWidth &&
                                                                                            W.Start[middlex6][0] == W.End[up1][0] &&
                                                                                            W.Start[middlex6][1] == W.Start[down2][5] &&
                                                                                            W.Start[middlex6][2] == W.End[up3][0] &&
                                                                                            W.Id[middlex6] != W.Id[outerx5] &&
                                                                                            W.Id[middlex6] != W.Id[middlex4] &&
                                                                                            W.Id[middlex6] != W.Id[left3] &&
                                                                                            W.Id[middlex6] != W.Id[up3] &&
                                                                                            W.Id[middlex6] != W.Id[middlex2] &&
                                                                                            W.Id[middlex6] != W.Id[down2] &&
                                                                                            W.Id[middlex6] != W.Id[right1] &&
                                                                                            W.Id[middlex6] != W.Id[up1]) {
                                                                                            //print("middlex6:\(W.Start[middlex6])")

                                                                                            if phase == 0 {
                                                                                                shapeCount += 1
                                                                                            }
                                                                                            else {
                                                                                                outerStart[index + 4] = UInt8(outerx5Pos)

                                                                                                ClusterHelper.AddWords(index: &index, wordId: &wordId, wordsToAdd: [right1, middlex2, left3, middlex4, outerx5, middlex6, up1, down2, up3])
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
            patternHorizontal: [.trailing, .middle, .leading, .middle, .outer, .middle],
            patternVertical: [.leading, .trailing, .leading],
            interlockWidth: interlockWidth,
            interlockHeight: interlockHeight,
            stride: stride,
            size: shapeCount)
    }
}